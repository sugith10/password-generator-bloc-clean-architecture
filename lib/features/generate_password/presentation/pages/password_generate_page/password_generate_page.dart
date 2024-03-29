import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/data/local/password_gnerator.dart';
import 'package:password_generator/features/generate_password/data/repositories/password_repo_impl.dart';
import 'package:password_generator/features/generate_password/domain/use_cases/pasword_use_case.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/widget/copy_result_container.dart';
import 'package:password_generator/features/generate_password/presentation/widget/get_divider.dart';
import 'package:password_generator/features/generate_password/presentation/widget/header_two.dart';
import 'package:password_generator/features/generate_password/presentation/widget/password_button.dart';
import 'package:password_generator/features/generate_password/presentation/widget/password_length.dart';
import 'package:password_generator/features/generate_password/presentation/widget/password_settingfield.dart';

class PasswordGeneratePage extends StatelessWidget {
  const PasswordGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordGenratorBloc(
        PasswordUseCase(PasswordRepoImpl(PasswordGenerator())),
      ),
      child: const _PassWordGeneratePage(),
    );
  }
}

class _PassWordGeneratePage extends StatelessWidget {
  const _PassWordGeneratePage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Header(),
              SizedBox(
                height: 25,
              ),
              GetDivider(),
              SizedBox(
                height: 25,
              ),
              PasswordLength(),
              SizedBox(
                height: 25,
              ),
              GetDivider(),
              PassWordSettingField(),
              SizedBox(
                height: 25,
              ),
              GetDivider(),
              SizedBox(
                height: 25,
              ),
              CopyResultContainer(),
              SizedBox(
                height: 25,
              ),
              GetDivider(),
              SizedBox(
                height: 10,
              ),
              PasswordButton(),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
