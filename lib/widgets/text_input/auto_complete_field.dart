// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../styles/font/font_style.dart';

class AutoCompleteField<T> extends StatefulWidget {
  final String? labelText;
  final TextStyle? fieldStyle;
  final String? hintText;
  final TextInputType keyboardType;
  final bool enable;
  final int? maxLength;
  final TextAlign textAlign;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool hasTitle;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;

  final TextEditingController? controller;

  final SuggestionsCallback<T> suggestionsCallback;
  final ItemBuilder<T> itemBuilder;
  final SuggestionSelectionCallback<T> onSuggestionSelected;

  final Widget Function(BuildContext context, Object? error)? errorBuild;

  String? itemNotFound;

  AutoCompleteField({
    Key? key,
    this.labelText,
    this.fieldStyle,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.obscureText = false,
    this.enable = true,
    this.maxLength,
    this.textCapitalization = TextCapitalization.sentences,
    this.hasTitle = true,
    this.validator,
    this.focus,
    required this.controller,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    this.itemNotFound,
    this.errorBuild,
  }) : super(key: key);

  @override
  _AutoCompleteFieldState<T> createState() => _AutoCompleteFieldState();
}

class _AutoCompleteFieldState<T> extends State<AutoCompleteField<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.focus != null) {
      widget.focus!.addListener(() {
        if (!widget.focus!.hasFocus) {
          if (widget.controller != null) {
            if (widget.controller!.text.isNotEmpty && _selectedItem != null) {
              widget.onSuggestionSelected.call(_selectedItem as T);
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      child: TypeAheadFormField<T>(
        hideOnEmpty: widget.itemNotFound == null,
        noItemsFoundBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.itemNotFound ?? '',
                  textAlign: TextAlign.center,
                  style: fontBody1(context),
                ),
              ],
            ),
          );
        },
        validator: widget.validator ??
            (value) => value!.isEmpty
                ? "${widget.labelText ?? widget.hintText} ${'not_empty'.tr}"
                : null,
        textFieldConfiguration: TextFieldConfiguration(
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          textAlign: widget.textAlign,
          textCapitalization: widget.textCapitalization,
          textInputAction: TextInputAction.search,
          enabled: widget.enable,
          autofocus: false,
          focusNode: widget.focus,
          controller: widget.controller,
          style: widget.fieldStyle ?? fontBody1(context),
          cursorColor: Theme.of(context).textTheme.bodyText1!.color!,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: GestureDetector(
              onTap: () => widget.controller?.clear(),
              child: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            hintStyle: fontBody1(
              context,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).errorColor,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        suggestionsCallback: (search) async {
          var results = await widget.suggestionsCallback.call(search);
          _selectedItem = results.length == 1 ? results.first : null;
          return results;
        },
        itemBuilder: widget.itemBuilder,
        onSuggestionSelected: widget.onSuggestionSelected,
        errorBuilder: widget.errorBuild ??
            (context, error) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: fontBody1(
                        context,
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ],
                ),
              );
            },
        loadingBuilder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
