import 'package:agricstock/providers/language_provider.dart';
import 'package:agricstock/shared/domain/news.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/util/extension/translate_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsDetailScreen extends ConsumerWidget {
  const NewsDetailScreen(this.news, {super.key});

  final News news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetLanguage = ref.watch(currentLanguage);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(body: "News Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: news.image,
                fit: BoxFit.cover,
              ),
            ),
            FutureBuilder<String>(
              future: news.content.translateToString(targetLanguage),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: SpinKitSpinningLines(
                    color: Color.fromARGB(255, 39, 212, 163),
                  ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Html(data: snapshot.data ?? news.content);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
