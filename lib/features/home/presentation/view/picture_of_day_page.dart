import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/data/datasources/picture_of_day_datasource.dart';
import 'package:nasa_api/features/home/presentation/bloc/picture_of_day_bloc.dart';

class PictureDayPage extends StatefulWidget {
  const PictureDayPage({super.key});

  @override
  State<PictureDayPage> createState() => _PictureDayPageState();
}

class _PictureDayPageState extends State<PictureDayPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PictureOfDayBloc>().add(GetPictureOfDay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center()));
  }
}
