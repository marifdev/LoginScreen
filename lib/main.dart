import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: MyHomePage(title: 'Login Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;
  bool _isPasswordVisible = false;
  bool isRemembered = false;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75.0, bottom: 25.0),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  buildGoogleButton(),
                  buildFacebookButton(),
                  buildDividerWithText(),
                  buildUsernameInputColumn(),
                  buildPasswordInputColumn(),
                  buildRememberAndForgotPasswordRow(),
                  buildLoginButton(),
                  buildSignUpRow()
                ],
              ),
            ),
          ),
        ));
  }

  Row buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Color(0xFF595858)),
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }

  SizedBox buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Color(0xFF272727),
          onPressed: () => {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFF66053),
                  Color(0xFFCE2E70),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRememberAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Switch(
              value: isRemembered,
              onChanged: (value) {
                setState(() {
                  isRemembered = value;
                });
              },
              activeTrackColor: Colors.green,
              activeColor: Colors.greenAccent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.blue,
            ),
            Text(
              'Remember me',
              style: TextStyle(color: Color(0xFF595858)),
            ),
          ],
        ),
        FlatButton(
          onPressed: () => {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Color(0xFF595858)),
          ),
        )
      ],
    );
  }

  Padding buildUsernameInputColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Username",
                  style: TextStyle(color: Color(0xFF595858)),
                ),
              )
            ],
          ),
          TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              fillColor: Color(0xFF272727),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildPasswordInputColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Password",
                  style: TextStyle(color: Color(0xFF595858)),
                ),
              )
            ],
          ),
          TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: _isPasswordVisible
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        Icons.visibility_off,
                        color: Color(0xFF595858),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        Icons.visibility,
                        color: Color(0xFF595858),
                      ),
                    ),
              fillColor: Color(0xFF272727),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildDividerWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            color: Color(0xFF595858),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Or",
              style: TextStyle(color: Color(0xFF595858)),
            ),
          ),
          Expanded(
              child: Divider(
            color: Color(0xFF595858),
          )),
        ],
      ),
    );
  }

  SizedBox buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Color(0xFF272727),
          onPressed: () => {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image(
                    image: AssetImage('assets/google.png'),
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                const Text('Use Google Account',
                    style: TextStyle(color: Color(0xFF595858))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildFacebookButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Color(0xFF272727),
          onPressed: () => {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image(
                    image: AssetImage('assets/facebook.png'),
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                const Text('Use Facebook Account',
                    style: TextStyle(color: Color(0xFF595858))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
