var list = [16, 17, 18, 19, 20, 6, 7, 8, 9, 10, 13, 14, 11, 12, 15, 2, 3, 4, 5, 1, 21, 22, 23, 24, 25];
var themeList = ['accommodation', 'restaurant', 'cafe', 'attraction', 'activity'];
var valList = new Array();
var cycle = 1;

$(document).ready(function () {
    for (var k = 1; k < 6; k++) {
        google.charts.load("current", {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);
    }
});

function detailInfo(id) {
    window.open('generalUserInfo?no=' + id, 'general user information', 'width=850,height=900,location=no,status=no,scrollbars=yes');
}

function detailInfoOwner(id) {
    window.open('ownerUserInfo?no=' + id, 'owner user information', 'width=850,height=900,location=no,status=no,scrollbars=yes');
}

function detailNotice(id) {
    window.open('noticeDetail?no=' +id,'notice detail','width=1000,height=900,location=no,status=no,scrollbars=yes');
}

function noticeWriting() {
    window.open('noticeWriting','notice writing','width=1000,height=900,location=no,status=no,scrollbars=yes');
}
function detailQuestion(id, type) {
   window.open('questionDetail?no=' +id + '&type=' +type,'question detail','width=1000,height=1000,location=no,status=no,scrollbars=yes');
}
function drawChart() {
    for (var i = 0; i < list.length; i++) {
        valGetter(i);
    }
}

function drawingChart() {
    console.log("drawStart")
    var data = google.visualization.arrayToDataTable([
        ["area", "count", {role: "style"}],
        ["강남구", Number(valList[0]), "#FF0000"],
        ["강동구", Number(valList[1]), "#00FF00"],
        ["강서구", Number(valList[2]), "#0000FF"],
        ["강북구", Number(valList[3]), "color: #FFFF00"],
        ["관악구", Number(valList[4]), "#00FFFF"],
        ["광진구", Number(valList[5]), "FF00FF"],
        ["구로구", Number(valList[6]), "C0C0C0"],
        ["금천구", Number(valList[7]), "color: #8A2BE2"],
        ["노원구", Number(valList[8]), "#A52A2A"],
        ["동대문구", Number(valList[9]), "DEB887"],
        ["도봉구", Number(valList[10]), "7FFF00"],
        ["동작구", Number(valList[11]), "color: #FF7F50"],
        ["마포구", Number(valList[12]), "#6495ED"],
        ["서대문구", Number(valList[13]), "00008B"],
        ["성동구", Number(valList[14]), "006400"],
        ["성북구", Number(valList[14]), "color: #BDB76B"],
        ["서초구", Number(valList[14]), "#8B008B"],
        ["송파구", Number(valList[14]), "FF8C00"],
        ["영등포구", Number(valList[14]), "8FBC8F"],
        ["용산구", Number(valList[14]), "color: #2F4F4F"],
        ["양천구", Number(valList[14]), "#00CED1"],
        ["은평구", Number(valList[14]), "9400D3"],
        ["종로구", Number(valList[14]), "FF1493"],
        ["중구", Number(valList[14]), "color: #00BFFF"],
        ["중랑구", Number(valList[24]), "color: #1E90FF"]
    ]);

    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1,
        { calc: "stringify",
            sourceColumn: 0,
            type: "string",
            role: "annotation" },
        2]);
    var options = {
        title: "Theme Chart",
        width: 1300,
        height:600,
        bar: {
            groupWidth: "90%",
            groupHeight:"100%"
        },
        legend: {position: "none"},
        axes: {
            x: {
                0: { side: 'top', label: 'Percentage'} // Top x-axis.
            }
        },
    };
    var chart = new google.visualization.BarChart(document.getElementById("chart_area" + cycle));
    chart.draw(view, options);
    cycle++;
    console.log("finish");
}


function valGetter(n) {
    $.ajax({
        url: '/api/area/get/' + themeList[0] + '/' + list[n],
        type: "GET",
        contentType: 'application/json',
        success: function (data) {
            valList[n] = data;
            if(n == 14){
                drawingChart();
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}
