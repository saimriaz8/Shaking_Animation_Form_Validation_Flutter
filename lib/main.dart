import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shaking_animation_form_flutter/extension_on_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shaking Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  late AnimationController _animationControllerName;
  late Animation<double> _animationName;
  late AnimationController _animationControllerEmail;
  late Animation<double> _animationEmail;
  late AnimationController _animationControllerPhone;
  late Animation<double> _animationPhone;
  Color textFieldNameColor = Colors.black;
  Color textFieldEmailColor = Colors.black;
  Color textFieldPhoneColor = Colors.black;
  String name = 'Name';
  String email = 'Email';
  String phone = 'Phone';
  List<Color> listOfColor =  [
  const Color(0xFF000000), // Black (Main Heading Text)
  const Color(0xFF1A1A1A), // Almost Black (Subheadings & Strong Text)
  const Color(0xFF333333), // Dark Gray (Input Labels & Form Titles)
  const Color(0xFF4A4A4A), // Slightly Lighter Dark Gray (Balance for Text)
  const Color(0xFF555555), // Medium Gray (Placeholder Text)
  const Color(0xFF666666), // Slightly Lighter Medium Gray (Supportive Elements)
  const Color(0xFF777777), // Light Gray (Disabled Text & Muted Labels)
  const Color(0xFF8C8C8C), // Muted Gray (Secondary Text)
  const Color(0xFFA0A0A0), // Soft Neutral Gray (For Less Important Text)
  const Color(0xFFB0B0B0), // Light Neutral Gray (Subtle Separators)
  const Color(0xFFCCCCCC), // Soft Gray (Input Borders & Dividers)
  const Color(0xFFD9D9D9), // Very Light Gray (Background & Panels)
  const Color(0xFFE0E0E0), // Lighter Gray (Input Background)
  const Color(0xFFEAEAEA), // Extra Light Gray (Card & Form Background)
  const Color(0xFFF5F5F5), // Near White (Overall Background)
];


  @override
  void initState() {
    super.initState();
    _animationControllerName = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(
        () {
          setState(() {});
        },
      );
    _animationControllerEmail = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(
        () {
          setState(() {});
        },
      );

    _animationControllerPhone = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(
        () {
          setState(() {});
        },
      );

    _animationName = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15, end: -15), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -15, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 2),
    ]).animate(_animationControllerName);

    _animationEmail = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 2),
    ]).animate(_animationControllerEmail);

    _animationPhone = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 2),
    ]).animate(_animationControllerPhone);
  }

  @override
  void dispose() {
    // Dispose controllers to free up memory
    _animationControllerName.dispose();
    _animationControllerEmail.dispose();
    _animationControllerPhone.dispose();
    super.dispose();
  }

  String? isTextFieldEmpty(String? value) {
    setState(() {});
    if (value != '') {
      textFieldNameColor = Colors.black;
      name = 'Name';
      return null;
    } else {
      textFieldNameColor = Colors.red;
      name = 'Field is empty';
      _animationControllerName.forward(from: 0);
      return '';
    }
  }

  String? correctEmail(String? value) {
    setState(() {});
    if (value.isValidEmail()) {
      textFieldEmailColor = Colors.black;
      return null;
    } else {
      email = 'Invalid email';
      textFieldEmailColor = Colors.red;
      _animationControllerEmail.forward(from: 0);
      return '';
    }
  }

  String? correctPhone(String? value) {
    setState(() {});
    if (value.isValidPhoneNumber()) {
      textFieldPhoneColor = Colors.black;
      return null;
    } else {
      phone = 'Invalid phone';
      textFieldPhoneColor = Colors.red;
      _animationControllerPhone.forward(from: 0);
      return '';
    }
  }

  void onPressedSubmit() {
    if (_formStateKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form Submit Successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText('Validation Using Shaking Animation',
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    colors: listOfColor, speed: const Duration(milliseconds: 800))
              ],
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: width * 0.6,
                height: height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.6,
                        height: height * 0.07,
                        decoration: const BoxDecoration(
                            color: Color(0xff2A3136),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                width: width * 0.3,
                                height: 2.0,
                                decoration: BoxDecoration(
                                    color: const Color(0xff797C80),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Color(0xff797C80),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.6,
                        height: height * 0.53,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Center(
                          child: Form(
                            key: _formStateKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Transform.translate(
                                  offset: Offset(_animationName.value, 0),
                                  child: SizedBox(
                                    width: width * 0.4,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textFieldNameColor),
                                          ),
                                          TextFormField(
                                            cursorColor: Colors.black,
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xffEFF0F0),
                                                border: InputBorder.none),
                                            validator: isTextFieldEmpty,
                                          ),
                                        ]),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(_animationEmail.value, 0),
                                  child: SizedBox(
                                    width: width * 0.4,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            email,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textFieldEmailColor),
                                          ),
                                          TextFormField(
                                            cursorColor: Colors.black,
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xffEFF0F0),
                                                border: InputBorder.none),
                                            validator: correctEmail,
                                          ),
                                        ]),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(_animationPhone.value, 0),
                                  child: SizedBox(
                                    width: width * 0.4,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            phone,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textFieldPhoneColor),
                                          ),
                                          TextFormField(
                                            cursorColor: Colors.black,
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xffEFF0F0),
                                                border: InputBorder.none),
                                            validator: correctPhone,
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.4,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: onPressedSubmit,
                                    style: ButtonStyle(
                                        foregroundColor:
                                            const WidgetStatePropertyAll(
                                                Colors.white),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Color(0xff9747FF)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)))),
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// enabledBorder: OutlineInputBorder(
//                                                 borderSide: const BorderSide(color: Colors.black),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderSide: const BorderSide(color: Colors.black),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)),
//                                               errorBorder: OutlineInputBorder(
//                                                 borderSide: const BorderSide(color: Colors.red),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)),