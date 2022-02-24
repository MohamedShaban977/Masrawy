import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/core/controllers/connection.dart';

import '../constants.dart';

class MaterialBuilderWidget extends StatelessWidget {
  MaterialBuilderWidget(this.child);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final cubit = ConnectionCubit.get(context);
    return BlocBuilder(

      cubit: cubit,
      builder: (context, state) => SafeArea(
        top: Platform.isAndroid,
        child: Directionality(
          child: Stack(
            children: [
              child,
              if (state is ConnectionLost)
                Scaffold(
                  body: Container(
                    color: Colors.black87,
                    width: double.infinity,
                    height: sizeFromHeight(0, removeAppBarSize: false),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.signal_wifi_off_rounded,
                          color: Colors.white,
                          size: sizeFromHeight(4),
                        ),
                        Text(
                          'لا يوجد إتصال بالانترنت!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Builder(
                          builder: (context) => Container(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  cubit.listenConnectionState();

                                  final ref =
                                      await Connectivity().checkConnectivity();
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(ref.toString())));
                                },
                                child: Text(
                                  'اعادة المحاولة',
                                  style: TextStyle(
                                    fontSize: 20,
                                    wordSpacing: 5,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
