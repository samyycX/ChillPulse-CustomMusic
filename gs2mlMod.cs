using UndertaleModLib;
using UndertaleModLib.Models;
using GMHooker;
using System.Reflection;
using System.Drawing;
using System.Security.Cryptography;

namespace custommusic;


public class CustomMusic
{
    public void Load(int audiogroup, UndertaleData data)
    {
        var dir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)!;
        string musicPath = Path.Combine(dir, "musics");
        if (!File.Exists(musicPath))
        {
            Directory.CreateDirectory(musicPath);
        }
        
        List<string> genres = new();
        List<List<string>> musics = new();
        Dictionary<string, string> musicNames = new();
        
        foreach(var directory in Directory.GetDirectories(musicPath))
        {
            var directoryName = directory.Split("\\").Last().Split("/").Last();
            genres.Add(directoryName);
            musics.Add(new List<string>());
            foreach(var music in Directory.GetFiles(Path.Combine(musicPath, directory)))
            {
                var musicName = music.Split("\\").Last().Split("/").Last().Replace(".ogg","");
                if (!music.EndsWith(".ogg"))
                {
                    Console.WriteLine($"[CustomMusic/WARNING] unsupported file {music} found.");
                    continue;
                }
                var md5 = MD5.Create();
                var crypt = md5.ComputeHash(System.Text.Encoding.Default.GetBytes($"{directoryName}_{musicName}"));
                md5.Clear();
                var id = "";
                for (int i = 0; i < crypt.Length; i++)
                {
                    id += crypt[i].ToString("x").PadLeft(2, '0');
                }
                id = "_custommusic_" + id;
                musics.Last().Add(id);
                AddSound(data, audiogroup, audiogroup, music, id);
                musicNames[id] = musicName.Replace("_", " ");
                Console.WriteLine($"[CustomMusic/SUCCESS] Add music {musicName}({id}) to genre {directoryName}.");
            }
        }
        string allMusicHookCode = "#orig#()";
        string genreColorHookCode = "";
        List<string> newGenres = new();
        string genreNameHookCode = "#orig#()";
        for(int i = 0; i < genres.Count; i++)
        {

            var musicIndexs = musics[i];
            allMusicHookCode += $"\nalbum_list[{7+i}]=[{string.Join(',', musicIndexs)}]\nalbum_name_list[{7+i}]=[{string.Join(',', musicIndexs.Select(index => $"\"{musicNames[index]}\"")).Replace('_', ' ')}]";
            genreNameHookCode += $"\n_text_custommusic_genre_{i} = \"{genres[i]}\"";
            // genreColorHookCode += $"""
            // else if array_contains(album_list[{6+i}], music_list[(i + current_music_list_start)])
            //     color_music = {randomColor()}
            // """;
            newGenres.Add($"_text_custommusic_genre_{i}");
        }
        Console.WriteLine($"[CustomMusic/DEBUG] allMusicHookCode = {allMusicHookCode}");
        Console.WriteLine($"[CustomMusic/DEBUG] genreNameHookCode = {genreNameHookCode}");
        Console.WriteLine($"[CustomMusic/DEBUG] genreColorHookCode = {genreColorHookCode}");
        Console.WriteLine($"[CustomMusic/DEBUG] newGenres = {newGenres}");
        data.HookFunction("all_music", allMusicHookCode);
        data.HookFunction("variables", genreNameHookCode);
    
        var draw = "gml_Object_obj_controller_Draw_64";
        var code = data.Code.ByName(draw);
        var codeLocals = data.CodeLocals.ByName(draw);
        
        AsmCursor cursor = new AsmCursor(data, code, codeLocals);
        
        cursor.GotoNext("pop.v.v local._music_genre");
        cursor.index -= 1;
        cursor.Replace($"call.i @@NewGMLArray@@(argc={7+newGenres.Count})");
        cursor.index -= 7;
        newGenres.Reverse();
        foreach( var genre in newGenres)
        {
            cursor.Emit($"push.v self.{genre}");
        }
        var cur = cursor.GetCurrent().Address;
        for ( int k = 0; k < code.Instructions.Count; k++)
        {
            var inst = code.Instructions.ElementAt(k);
            if (UndertaleInstruction.GetInstructionType(inst.Kind) == UndertaleInstruction.InstructionType.GotoInstruction)
            {
                if (inst.Address < cur && inst.Address + inst.JumpOffset >= cur)
                {
                    inst.JumpOffset += 2 * newGenres.Count();
                }
                if (inst.Address >= cur && inst.Address + inst.JumpOffset < cur)
                {
                    inst.JumpOffset -= 2 * newGenres.Count();
                }
            }
        }
    }

    public static UndertaleSound AddSound(UndertaleData data, int currentAudioGroup, int audioGroup, string file, string name) {
        if(currentAudioGroup == audioGroup)
            data.EmbeddedAudio.Add(new UndertaleEmbeddedAudio {
                Data = File.ReadAllBytes(file)
            });
        int audioId = -1;
        foreach(UndertaleSound s in data.Sounds)
            if(s.GroupID == audioGroup && s.AudioID > audioId)
                audioId = s.AudioID;

        audioId += 1;
        UndertaleSound sound = new() {
            Name = data.Strings.MakeString(name),
            Flags = UndertaleSound.AudioEntryFlags.Regular,
            File = data.Strings.MakeString(file),
            AudioID = audioId,
            AudioGroup = data.AudioGroups[audioGroup],
            GroupID = audioGroup
        };
        data.Sounds.Add(sound);
        return sound;
    }

    public int randomColor()
    {
        Array values = Enum.GetValues(typeof(KnownColor));
        Random random = new Random();
        KnownColor knownColor = (KnownColor)values.GetValue(random.Next(values.Length));
        Color color = Color.FromKnownColor(knownColor);
        return color.ToArgb();
    }
}
