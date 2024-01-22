import 'package:bookly_app/core/utils/functions/custom_snakbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunction(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, 'Cannot launch $url');
    }
  }
}
