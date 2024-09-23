import 'package:flutter/material.dart';
import 'package:nectar/add_screen/add_screen.dart';
import 'package:nectar/home/home_screen.dart';
import 'package:nectar/utils/video_record_widget.dart';

RouteFactory onAppGenerateRoutes() => (settings) {
      switch (settings.name) {
        case HomeScreen.route:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
          );

        case AddScreen.route:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AddScreen(),
          );
        case VideoRecorderWidget.route:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                VideoRecorderWidget(),
          );

        default:
          return null; // Handle unknown routes appropriately
      }
    };
