import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/temperature.dart';

class LineChartMedical extends StatefulWidget {
  String? measuredIndex;
  List<dynamic>? listOfValues;

  LineChartMedical({required this.measuredIndex, required this.listOfValues});

  @override
  State<StatefulWidget> createState() => LineChartMedicalState();
}

class LineChartMedicalState extends State<LineChartMedical> {
  bool isShowingMainData = true;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  int minY(String index) {
    switch (widget.measuredIndex) {
      case 'Puls':
        return 40;
      case 'Temperatura':
        return 15;
      case 'Umiditate':
        return 30;
    }
    return 0;
  }

  int maxY(String index) {
    switch (widget.measuredIndex) {
      case 'Puls':
        return 100;
      case 'Temperatura':
        return 25;
      case 'Umiditate':
        return 80;
    }
    return 0;
  }

  int rightInterval(String index) {
    switch (widget.measuredIndex) {
      case 'Puls':
        return 10;
      case 'Temperatura':
        return 1;
      case 'Umiditate':
        return 10;
    }
    return 0;
  }

  List<FlSpot> getFlSpots(List<dynamic> listOfValues) {
    List<FlSpot> result = List.empty(growable: true);
    int varX = 1;

    for (dynamic item in listOfValues) {
      int varY = 0;
      if (item is Pulse) {
        varY = item.pulse;
      } else if (item is Humidity) {
        varY = item.humidity;
      } else if (item is Temperature) {
        varY = item.temperature;
      }
      result.add(FlSpot(varX.toDouble(), varY.toDouble()));
      varX++;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                const Text(
                  'Valoarea medie a masuratorilor',
                  style: TextStyle(
                    color: Color(0xff827daa),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.measuredIndex!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      sampleData1(),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff72719b),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            margin: 10,
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return 'MAR';
                case 7:
                  return 'APR';
                case 12:
                  return 'MAI';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff75729e),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            getTitles: (value) {
              var val = value.toInt();

              switch (widget.measuredIndex) {
                case 'Puls':
                  {
                    if (val > 59 && val < 70) {
                      return '60';
                    } else if (val > 69 && val < 80) {
                      return '70';
                    } else if (val > 79 && val < 90) {
                      return '80';
                    } else if (val > 89 && val < 100) {
                      return '90';
                    } else if (val > 89 && val < 100) {
                      return '90';
                    } else if (val > 89 && val < 100) {
                      return '90';
                    }
                    return '';
                  }
                case 'Temperatura':
                  {
                    if (val == 18) {
                      return '18';
                    } else if (val == 19) {
                      return '19';
                    } else if (val == 20) {
                      return '20';
                    } else if (val == 21) {
                      return '21';
                    } else if (val == 22) {
                      return '22';
                    } else if (val == 23) {
                      return '23';
                    }
                    return '';
                  }
                case 'Umiditate':
                  {
                    if (val > 39 && val < 50) {
                      return '40%';
                    } else if (val > 49 && val < 60) {
                      return '50%';
                    } else if (val > 59 && val < 70) {
                      return '60%';
                    } else if (val > 69 && val < 80) {
                      return '70%';
                    }
                    return '';
                  }
              }
              return '';
            },
            margin: 8,
            reservedSize: 30,
            interval: rightInterval(widget.measuredIndex!).toDouble(),
          )),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: maxY(widget.measuredIndex!).toDouble(),
      minY: minY(widget.measuredIndex!).toDouble(),
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData pulseLineChartBarData1 = LineChartBarData(
      spots: getFlSpots(widget.listOfValues!),
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData tempLineChartBarData2 = LineChartBarData(
      spots: getFlSpots(widget.listOfValues!),
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData humidityLineChartBarData3 = LineChartBarData(
      spots: getFlSpots(widget.listOfValues!),
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    switch (widget.measuredIndex) {
      case 'Puls':
        return [pulseLineChartBarData1];
      case 'Temperatura':
        return [tempLineChartBarData2];
      case 'Umiditate':
        return [humidityLineChartBarData3];
    }
    return [pulseLineChartBarData1];
  }
}
