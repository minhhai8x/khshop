$(document).ready(function(){
	  chart_draw(data);
});
function chart_draw(p_data) {
    $('#sales').css({
        height: '200px',
        width: 'auto'
    });

    var plot = $.plot($("#sales"), [
		
		{ label: p_label, data: p_data }
	], {
		lines: {
			show: true
		},
		points: {
			show: true
		},
		grid: {
			backgroundColor: '#fffaff',
			hoverable: true,
			clickable: true
		},
		legend: {
			show: false
		}
	});

    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css({
            position: 'absolute',
            display: 'none',
            top: y + -36,
            left: x + -6,
            border: '1px solid #fdd',
            padding: '4px',
            'background-color': '#fee',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;

    $("#sales").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

        if (item) {
            if (previousPoint != item.datapoint) {
                previousPoint = item.datapoint;

                $("#tooltip").remove();
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);

                showTooltip(item.pageX, item.pageY, Math.round(y) + " " + item.series.label);
            }
        }
        else {
            $("#tooltip").remove();
            previousPoint = null;
        }
    });
}
;
