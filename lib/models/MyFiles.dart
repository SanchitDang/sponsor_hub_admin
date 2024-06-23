import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class PanelData {
  final String? svgSrc, title, total;
  final Color? color;

  PanelData({
    this.svgSrc,
    this.title,
    this.total,
    this.color,
  });
}

List demoData = [
  PanelData(
    title: "Users",
    svgSrc: "assets/icons/Documents.svg",
    total: "12",
    color: primaryColor,
  ),
  PanelData(
    title: "Influencers",
    svgSrc: "assets/icons/drop_box.svg",
    total: "9",
    color: Color(0xFFFFA113),
  ),
  PanelData(
    title: "Consulting",
    svgSrc: "assets/icons/google_drive.svg",
    total: "17",
    color: primaryColor,
  ),
  PanelData(
    title: "Transaction",
    svgSrc: "assets/icons/one_drive.svg",
    total: "8",
    color: Color(0xFFFFA113),
  ),
];
