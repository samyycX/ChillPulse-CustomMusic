function calendar_text() //gml_Script_calendar_text
{
    list_month = ["January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (current_language == 0)
        list_month = ["January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (current_language == 1 || current_language == 2 || current_language == 3)
        list_month = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
    if (current_language == 6)
        list_month = ["일월", "이월", "삼월", "사월", "오월", "유월", "칠월", "팔월", "구월", "십월", "십일월", "십이월"]
    if (current_language == 4)
        list_month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
    if (current_language == 5)
        list_month = ["январь", "февраль", "март", "апрель", "май", "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"]
    if (current_language == 7)
        list_month = ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"]
    if (current_language == 8)
        list_month = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]
    if (current_language == 9)
        list_month = ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"]
    if (current_language == 10)
        list_month = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
}

