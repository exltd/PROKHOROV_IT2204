import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Общежития КубГАУ',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HostelPage(),
    );
  }
}

class HostelPage extends StatefulWidget {
  const HostelPage({super.key});

  @override
  HostelPageState createState() => HostelPageState();
}

class HostelPageState extends State<HostelPage> {
  bool isFavorite = false;
  int favoriteCount = 26;

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteCount--;
      } else {
        favoriteCount++;
      }
      isFavorite = !isFavorite;
    });
  }

  void callButton() {
    // функция для перехода в Контакты (работает только на андроид)
    const url = 'content://com.android.contacts/contacts';
    launchUrl(Uri.parse(url)).catchError((e) {
      print("Ошибка: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Не удалось открыть контакты")));
    });
    print("Нажата кнопка 'позвонить'");
  }

  void routeButon() {
    print("Нажата кнопка 'маршрут'");
  }

  void shareButton() {
    print("Нажата кнопка 'поделиться'");
  }

  Widget buildButtonColumn(
    // виджет для отрисовки кнопок
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.green),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(statusBarHeight + kToolbarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: statusBarHeight,
              color: const Color.fromARGB(255, 0, 99, 0),
            ),
            Container(
              height: kToolbarHeight,
              color: const Color.fromARGB(255, 60, 170, 91),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Общежития КубГАУ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              'https://yastatic.net/naydex/yandex-search/w20iH1a36/y7e1a2-E/mso9Jv3ycveSziSVrWRLqyTNcqxfkLJDEPp5SdKL-p52ymF7gKwsOXTElLcI3OtAkpAljPA0Drm90i1wdCC7ZW_uOGL5NhZGdxvwpHgky5t07Kd4boF341Ur3WwXT_pes19heEbLOy5yM3el_9sssVK1gEm0xdq920SA/800x240',
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Общежитие №20',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Краснодар, ул.Калинина, 13',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: toggleFavorite,
                      ),
                      Text('$favoriteCount'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildButtonColumn(Icons.call, 'Позвонить', callButton),
                  buildButtonColumn(Icons.near_me, 'Маршрут', routeButon),
                  buildButtonColumn(Icons.share, 'Поделиться', shareButton),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.",
                style: TextStyle(fontSize: 16),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
