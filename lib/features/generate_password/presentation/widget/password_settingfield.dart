import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/widget/coustom_check_box.dart';

class PassWordSettingField extends StatelessWidget {
  const PassWordSettingField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Password Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10,),
        BlocBuilder<PasswordGenratorBloc, PasswordGenratorState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomCheckBox(
                        label: 'LowerCase (a-z)',
                        value: state.isLowercase,
                        onChanged: () => 
                        context.read<PasswordGenratorBloc>().add(ChangeLowercaseEvent()),
                      ),
                      CustomCheckBox(
                        label: 'Numbers (0-9)',
                        value: state.isNumbers,
                        onChanged: () => 
                        context.read<PasswordGenratorBloc>().add(ChangeNumbersEvnet()),
                      ),
                      CustomCheckBox(
                        label: 'Exclude Duplicate',
                        value: state.isExcludeDuplicate,
                        onChanged: () => 
                        context.read<PasswordGenratorBloc>().add(ChangeExcludeDuplicateEvent())
                        ,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    CustomCheckBox(
                      label: 'UpperCase (A-Z)',
                      value: state.isUppercase,
                      onChanged: ()=> 
                      context.read<PasswordGenratorBloc>().add(ChangeUppercaseEvent()),
                    ),
                    CustomCheckBox(
                      label: 'Symbols (!-\$^+)',
                      value: state.isSymbols,
                      onChanged: () => 
                      context.read<PasswordGenratorBloc>().add(ChangeSymbolsEvent())
                      ,
                    ),
                    CustomCheckBox(
                      label: 'Include Spaces',
                      value: state.isIncludeSpaces,
                      onChanged: ()=> context.read<PasswordGenratorBloc>().add(ChangeIncludeSpacesEvent())
                    ),
                  ],
                ))
              ],
            );
          },
        )
      ],
    );
  }
}
