import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {

  Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  }
  void call(String number) => _launchUrl("tel:$number");
  void sendSms(String number) => _launchUrl("sms:$number");
  void sendEmail(String email) => _launchUrl("mailto:$email");
  // void call(String number) => launch("tel:$number");
  // void sendSms(String number) => launch("sms:$number");
  // void sendEmail(String email) => launch("mailto:$email");
}