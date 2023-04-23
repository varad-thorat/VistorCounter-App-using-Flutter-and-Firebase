import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_app/form_screen.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey:"AIzaSyCDHLu_gr4ALWkm3Xbu48yZhtgQGBJ-LvY" , appId: "1:990041981008:android:97c15e8308fac16a8ed155", messagingSenderId: '990041981008', projectId: 'smlproject-b3a9e'));
  runApp(MyApp());
}

// {
//   "type": "service_account",
//   "project_id": "smlproject-b3a9e",
//   "private_key_id": "5e28c1e8881a05567a0ec53fffd714e6156a2661",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDENAdwRS5hVAyS\nk0ihOv+P267h7cgKi+D4Ld7l6OjUtZc8zNbB0/pMb1nAbuJCTJY9BEhTURPY5UTf\n2MLVALjYPw6XH6Dvn6oPhYrKYj5wnD8RAgcToYsfis0qN/yA7fBcuwytGa9vpnAY\nwUxFRKqcFU8HUmE9DcTdYtEswNMJNEkw9wcttuXQ4ZfHSNduy3V9spq+ZjZhwU25\nbuDw2mCLuXYq/XGFyLJslLxG60W7AmoHupJlv57r6XHlYh0yD1Sn6jhsqRST7eKa\nXI10oVVMrtq6fmbJAZEPNFSfzwNv1YIRqRwj5jbj/yKZLHhsqaMzTK8I6M6xZo7q\nk8N1tOPRAgMBAAECggEACgSXEaQypU0PlEdZaMQUqvF+WTJVKbaxLrLW4/nTs5Kv\nDW9vErgCWndAB6uRuW1kKWrnz3s/Dm7MaLqOXiZaic4UbmJyyvFl00OQDdvc0M6l\niLaICnhP3HUvmxV/Os0LXgy97bO3SbXfmN/7xzillnEfFyJdbSrgD6a9Q/H3hIt0\nQpi1CNtJRC9KwtWd2vO3boLTqq73/iNk5LCDNeqR9unPC7lCjR6Kp1CvT+U2nl8E\nwr8ktkKxyY+PWrAymWlV9cJXtenvmh1jcbKXZtzS2IEbLJ46C+N0VemF0kd/Otyi\nKRB5rz9LRtYCX0OlS7PSGa7nMEUDUsqtiYdjolE1gQKBgQDjjwfqNwh49PkZkt3R\n9xyuquFXaCKT54SCEas5mB5ql5p56REp6KZlXnbFZSk82WzXdBwpBV35WM78QIQZ\nThCuSp00YcZR/UiWJ22k4U/gDMgiaqMzrKThmmiTLKFGrZAODnjjuGtxjmOTDDLm\nAUJdApFaXoY+v6ILMmhr3zhusQKBgQDcub+OYA9ADJ4KQQMiV6Qwl2SEzdkXCqWG\nxtAS9E1E7PdXLfOGy7yWeKQ351whgkT8MElJFIkK3WtKw49xdFe/gfry7KL0dwMg\nL2C8+NI3d4+u+wCUA0m26ApMbwrQEVQ8XDCaXZiHZRPnbq2ZbmWzqqi2QHNPN90p\naQgyByZPIQKBgBu2NmOKciiwxIkdvo+sRTzsKGcJknRqlFN2rWBlKwcWEUTZYjK1\nV1Yu683cJOp5G+0dAbTpJ2mPLB3CCZQ/Un63LW/MnGctriJDCPI0UhLZ26F9VQSc\n+LNUp3mMzNMbndhoYMZylfsNOQkWSjiCXL+Q6XyU2EpZ8fTlHZxNYcTxAoGAZbnF\nqtxiquYlwBwOUbmKlkpvrTUhpBjoCKGAK/wj0GxV4fvvjGRBWifnp0wdjeP33zJx\n1Bh+wF8jn6VZarRv7Hb/LQ4aXAitjBvJvc3/NEkKE17i+VQ6mO2AMZHLrfEOnXLv\ng3U3Ys8WyUadA2V5wcAZWUWC3zOj3f3mJQheg4ECgYA+1o1c9Dyw8+kLCmYnuMcw\ntwbijD5nkQVgG1mHlS+Y4CHwl0KUjKjfANMQLXK5YxKZudsLooucS8srxEWZpBGf\nzI/OY/dhN/2yGaQcySSG+gPVvqgbc6E1tiwQ+QujgQENR6JRH7Jmz0Fob5v3+mhJ\nPGl1CoUCnPN6jzuS9/Wr7Q==\n-----END PRIVATE KEY-----\n",
//   "client_email": "firebase-adminsdk-pd1vr@smlproject-b3a9e.iam.gserviceaccount.com",
//   "client_id": "112278227403318602481",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-pd1vr%40smlproject-b3a9e.iam.gserviceaccount.com"
// }



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FormScreen(),
    );
  }
}
