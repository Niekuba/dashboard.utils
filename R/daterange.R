date_origin <- c((Sys.Date() - days(10)), Sys.Date())
htmlcode <- '
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
'
jscode <- '
$(function() {

$("#reportrange").daterangepicker({
"ranges": {
"Today": [moment(), moment()],
"Yesterday": [moment().subtract(1, "days"), moment().subtract(1, "days")],
"Last 7 Days": [moment().subtract(6, "days"), moment()],
"Last 30 Days": [moment().subtract(29, "days"), moment()],
"This Month": [moment().startOf("month"), moment().endOf("month")],
"Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
},
"autoApply": true,
"autoUpdateInput": true,
"locale": {
"format": "YYYY-MM-DD",
"separator": " - ",
"applyLabel": "Apply",
"cancelLabel": "Cancel",
"fromLabel": "From",
"toLabel": "To",
"customRangeLabel": "Custom",
"weekLabel": "W",
"daysOfWeek": [
"Su",
"Mo",
"Tu",
"We",
"Th",
"Fr",
"Sa"
],
"monthNames": [
"January",
"February",
"March",
"April",
"May",
"June",
"July",
"August",
"September",
"October",
"November",
"December"
],
"firstDay": 1
},
"alwaysShowCalendars": true
},
function(start, end, label) {
Shiny.onInputChange("filterDate", start.format("YYYY-MM-DD") + "," + end.format("YYYY-MM-DD"));
$("#pickervalue").text(start.format("YYYY-MM-DD") + " - " + end.format("YYYY-MM-DD"));
}
);
});
'
set_date <- sprintf('
                    $("#reportrange").data("daterangepicker").setStartDate("%s");
                    $("#reportrange").data("daterangepicker").setEndDate("%s");
                    ', date_origin[1], date_origin[2])


daterangeUI <- function(id) {
  ns <- NS(id)
  tagList(
    tags$head(
      tags$script(jscode)
    ),
    tags$div(
      HTML(htmlcode),
      id = 'reportrange', class = 'pull-right',
      style = "background: #000; margin: 10px; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 90%",
      tags$i(class="glyphicon glyphicon-calendar fa fa-calendar"), HTML('&nbsp;'), tags$span(id = 'pickervalue',
                                                                                             paste0(date_origin, collapse = ' - ')),
      tags$b(class = 'caret')
    )
  )
}

daterange <- function(input, output, session) {
  runjs(set_date)
}
