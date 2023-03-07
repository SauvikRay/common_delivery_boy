import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/intl_phone_number_input_test.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/providers/country_provider.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
import 'package:intl_phone_number_input/src/widgets/item.dart';
import 'package:wholesale_delivery_boy/my_theme.dart';
import 'package:intl_phone_number_input/src/widgets/countries_search_list_widget.dart';
import 'package:intl_phone_number_input/src/utils/widget_view.dart';
import 'package:intl_phone_number_input/src/utils/formatter/as_you_type_formatter.dart';


class CustomInternationalPhoneNumberInput extends StatefulWidget {
   final SelectorConfig selectorConfig;

   ValueChanged<PhoneNumber> onInputChanged;
   ValueChanged<bool>? onInputValidated;

   VoidCallback? onSubmit;
   ValueChanged<String>? onFieldSubmitted;
   String? Function(String?)? validator;
   ValueChanged<PhoneNumber>? onSaved;
   TextEditingController? textFieldController;
   TextInputType keyboardType;
   TextInputAction? keyboardAction;

   PhoneNumber? initialValue;
  final String hintText;
  final String errorMessage;

  final double? selectorButtonOnErrorPadding;
  final double spaceBetweenSelectorAndTextField;
  final int maxLength;

  final bool isEnabled;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool countrySelectorScrollControlled;

  String? locale;

   TextStyle? textStyle;
   TextStyle? selectorTextStyle;
   InputBorder? inputBorder;
   InputDecoration? inputDecoration;
  //  InputDecoration searchBoxDecoration;
   Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

 FocusNode? focusNode;
 Iterable<String>? autofillHints;
 List<String>? countries;
 CustomInternationalPhoneNumberInput({super.key, 
   this.selectorConfig =const SelectorConfig(),
   required this.onInputChanged,
   this.onInputValidated,
   this.onSubmit,
   this.onFieldSubmitted,
  this.validator,
   this.onSaved,
   this.textFieldController,
   this.keyboardAction,
   this.keyboardType = TextInputType.phone,
   this.initialValue,
   this.hintText = 'Phone number',
   this.errorMessage = 'Invalid phone number',
   this.selectorButtonOnErrorPadding = 24,
   this.spaceBetweenSelectorAndTextField = 12,
   this.maxLength = 15,
   this.isEnabled = true,
   this.formatInput = true,
   this.autoFocus = false,
   this.autoFocusSearch = false,
   this.autoValidateMode = AutovalidateMode.disabled,
   this.ignoreBlank = false,
   this.countrySelectorScrollControlled = true,
   this.locale,
   this.textStyle,
   this.selectorTextStyle,
   this.inputBorder,
   this.inputDecoration,
  //  req this.searchBoxDecoration,
   this.textAlign = TextAlign.start,
   this.textAlignVertical = TextAlignVertical.center,
   this.scrollPadding = const EdgeInsets.all(20.0),
   this.focusNode,
   this.cursorColor,
   this.autofillHints,
   this.countries
   });

  @override
  State<CustomInternationalPhoneNumberInput> createState() => _InputWidgetState(); //_CustomInternationalPhoneNumberInputState();
}


class _InputWidgetState extends State<CustomInternationalPhoneNumberInput>{


   TextEditingController controller = TextEditingController();
  double selectorButtonBottomPadding = 0;
  Country country = Country(name: "Bangladesh",alpha2Code: "BD",alpha3Code: "BGD",dialCode: "+880",flagUri: 'assets/flags/bd.png');
  List<Country>countries=[];

    bool isNotValid = true;

    @override
  void initState() {
    loadCountries();
    initialiseWidget();
    

    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if(mounted){
    super.setState(fn);
    }
  }

  void loadCountries({ Country? previouslySelectedCountry }){

    if(mounted){
      List<Country> countries = CountryProvider.getCountriesData(countries: widget.countries);
       final CountryComparator? countryComparator = widget.selectorConfig.countryComparator;
       if(countryComparator != null){
        countries.sort(countryComparator);
       }
       country = previouslySelectedCountry?? Utils.getInitialSelectedCountry(countries, widget.initialValue!.isoCode!);
      setState(() {        
        this.countries =countries;
        country =country;
      });
    }
  }

  void initialiseWidget()async{
    String phoneNumber= widget.initialValue!.phoneNumber as String;
    String isoCode= widget.initialValue!.isoCode as String;
    bool boolVal = await PhoneNumberUtil.isValidNumber(phoneNumber: phoneNumber, isoCode: isoCode) as bool;
      if(widget.initialValue !=null){
        if(widget.initialValue!.phoneNumber !=null && widget.initialValue!.phoneNumber!.isNotEmpty && boolVal ){
          controller.text = await PhoneNumber.getParsableNumber(widget.initialValue!);
          phoneNumberControllerListener();
        }
      }
  }


  void phoneNumberControllerListener(){
    if(mounted){
        String parsedPhoneNumberString = controller.text.replaceAll(RegExp(r'[^\d+]'), '');

        getParsedPhoneNumber(parsedPhoneNumberString, country.alpha2Code as String).then((phoneNumber){

          if(phoneNumber == null){
            String phoneNumber = '${country.dialCode}$parsedPhoneNumberString';
            if(widget.onInputChanged !=null){
              widget.onInputChanged(PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country.alpha2Code,
                dialCode: country.dialCode
              ));
            }
            
            if(widget.onInputValidated !=null){
              widget.onInputValidated!( false);// as ValueChanged<bool>?;
            }
            isNotValid = true;

           
          }else{
              if (widget.onInputChanged != null) {
                     widget.onInputChanged(PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country.alpha2Code,
                dialCode: country.dialCode));
               }
               if (widget.onInputValidated != null) {
            widget.onInputValidated!(true);
            isNotValid = true;
          }
          }
        });
    }
  }

 Future<String?> getParsedPhoneNumber(
      String phoneNumber, String isoCode) async {

    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: phoneNumber, isoCode: isoCode) as bool;

        if (isValidPhoneNumber) {
          return await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: phoneNumber, isoCode: isoCode) as String;
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

InputDecoration getInputDecoration(InputDecoration? decoration){

    InputDecoration mainDecoration = decoration ??
        InputDecoration(
          border: widget.inputBorder ?? const UnderlineInputBorder(),
          hintText: widget.hintText,
        );
        if(widget.selectorConfig.setSelectorButtonAsPrefixIcon){
          return mainDecoration.copyWith(
            prefixIcon: CustomSelectorButton(
        country: country,
        countries: countries,
        onCountryChanged: onCountryChanged,
        selectorConfig: widget.selectorConfig,
        selectorTextStyle: widget.selectorTextStyle!,
        // searchBoxDecoration: widget.searchBoxDecoration!,
        locale: locale,
        isEnabled: widget.isEnabled,
        autoFocusSearchField: widget.autoFocusSearch,
        isScrollControlled: widget.countrySelectorScrollControlled,
      )
          );
        }

        return mainDecoration;
}

 /// Validate the phone number when a change occurs
  void onChanged(String value) {
    phoneNumberControllerListener();
  }



  /// Changes Selector Button Country and Validate Change.
void onCountryChanged(Country? country) {
    setState(() {
      country = country;
    });
    phoneNumberControllerListener();
  }


String get locale {
  if(widget.locale == null) return '';
  if(widget.locale!.toLowerCase() == 'nb' ||
   widget.locale!.toLowerCase() == 'nn'){
    return 'no';
   }
   return widget.locale!;
}

String? validator(String? value) {
    bool isValid =
        isNotValid && (value!.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          selectorButtonBottomPadding =
              widget.selectorButtonOnErrorPadding ?? 24;
        });
      } else {
        setState(() {
          selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage : null;
  }

    /// Saved the phone number when form is saved
  void onSaved(String? value) {
    _phoneNumberSaved();
  }


    void _phoneNumberSaved() {
    if (mounted) {
      String parsedPhoneNumberString =
          controller.text.replaceAll(RegExp(r'[^\d+]'), '');

      getParsedPhoneNumber(parsedPhoneNumberString, country.alpha2Code as String)
          .then(
        (phoneNumber) => widget.onSaved?.call(
          PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: country.alpha2Code,
              dialCode: country.dialCode),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return _InputWidgetView(
      state: this,
    );
  }

}


class _InputWidgetView extends WidgetView<CustomInternationalPhoneNumberInput, _InputWidgetState>{

   final _InputWidgetState state;
    _InputWidgetView({Key? key, required this.state}):super(key:key,state:state);
      // : super(key: key, state: state);

      @override
      Widget build(BuildContext context){
        final countryCode = state.country.alpha2Code ?? '';
        final dialCode = state.country.dialCode ?? '';
        return Container(
          child:Row(
            textDirection:TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                     CustomSelectorButton(
                country: state.country,
                countries: state.countries,
                onCountryChanged: state.onCountryChanged,
                selectorConfig: widget.selectorConfig,
                selectorTextStyle: widget.selectorTextStyle!,
                // searchBoxDecoration: widget.searchBoxDecoration,
                locale: state.locale,
                isEnabled: widget.isEnabled,
                autoFocusSearchField: widget.autoFocusSearch,
                isScrollControlled: widget.countrySelectorScrollControlled,
              ),
              SizedBox(
                height: state.selectorButtonBottomPadding,
              ),
                ],
              ),
                Flexible(
            child: TextFormField(
              key: const Key(TestHelper.TextInputKeyValue),
              textDirection: TextDirection.ltr,
              controller: state.controller,
              focusNode: widget.focusNode,
              enabled: widget.isEnabled,
              autofocus: widget.autoFocus,
              keyboardType: widget.keyboardType,
              textInputAction: widget.keyboardAction,
              style: widget.textStyle,
              decoration: state.getInputDecoration(widget.inputDecoration),
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              onEditingComplete: widget.onSubmit,
              onFieldSubmitted: widget.onFieldSubmitted,
              autovalidateMode: widget.autoValidateMode,
              autofillHints: widget.autofillHints,
              validator:widget.validator ?? state.validator,
              onSaved: state.onSaved,
              scrollPadding: widget.scrollPadding,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.maxLength),
                widget.formatInput
                    ? AsYouTypeFormatter(
                        isoCode: countryCode,
                        dialCode: dialCode,
                        onInputFormatted: (TextEditingValue value) {
                          state.controller.value = value;
                        },
                      )
                    : FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: state.onChanged,
            ),
          )
        

            ],

          ) ,
        );
      }
}

class CustomSelectorButton extends StatelessWidget {
  final List<Country> countries;
  final Country country;
  final SelectorConfig selectorConfig;
  final TextStyle selectorTextStyle;
  // final InputDecoration searchBoxDecoration;
  final bool autoFocusSearchField;
  final String locale;
  final bool isEnabled;
  final bool? isScrollControlled;
  final ValueChanged<Country?> onCountryChanged;
  const CustomSelectorButton({super.key,
  required this.countries,
  required this.country,
  required this.selectorConfig,
  required this.selectorTextStyle,
  // required this.searchBoxDecoration,
  required this.autoFocusSearchField,
  required this.locale,
  required this.onCountryChanged,
  required this.isEnabled,
  required this.isScrollControlled,

  });

  @override
  Widget build(BuildContext context) {
    return selectorConfig.selectorType == PhoneInputSelectorType.DROPDOWN? countries.isNotEmpty && countries.length >1?
    DropdownButtonHideUnderline(
      child: DropdownButton<Country>(
        key: const Key(TestHelper.DropdownButtonKeyValue),
        hint: Item(country: country,
        showFlag: selectorConfig.showFlags,
        useEmoji: selectorConfig.useEmoji,
        textStyle: selectorTextStyle,
        ),
        value: country,
        items: mapCountryToDropdownItem(countries),
        onChanged: isEnabled ? onCountryChanged : null,
        )
    
    ):Item(country: country,
    showFlag: selectorConfig.showFlags,
    useEmoji: selectorConfig.useEmoji,
    textStyle: selectorTextStyle,):
    Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: MyTheme.textfield_grey,
          width: .5
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0))),
          child: MaterialButton(
            key: const Key(TestHelper.DropdownButtonKeyValue),
            padding: EdgeInsets.zero,
            minWidth: 0,
            color: MyTheme.grey_153,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0)
            )),
            onPressed:countries.isNotEmpty && countries.length>1 && isEnabled?()async{
              Country selected;
              if(selectorConfig.selectorType ==  PhoneInputSelectorType.BOTTOM_SHEET){
                selected = await showCountrySelectorBottomSheet(context, countries);
              }else{
                selected = await showCountrySelectorDialog(context, countries);
              }
              if(selected != null){
                onCountryChanged(selected);
              }
            }: null,
            child:  Padding(padding: const EdgeInsets.only(right: 8.0),
            child: Item(
                    country: country,
                    showFlag: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    textStyle: TextStyle(
                        color: MyTheme.textfield_grey) //selectorTextStyle,
                    ),
                  ),
             ),
    );
  }


  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(
      List<Country> countries) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Item(
          key: Key(TestHelper.countryItemKeyValue(country.alpha2Code)),
          country: country,
          showFlag: selectorConfig.showFlags,
          useEmoji: selectorConfig.useEmoji,
          textStyle: selectorTextStyle,
          withCountryNames: false,
        ),
      );
    }).toList();
  }


    /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.DIALOG] is selected
 showCountrySelectorDialog(
      BuildContext context, List<Country> countries) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: double.maxFinite,
          child: CountrySearchListWidget(
            countries,
            locale,
            // searchBoxDecoration: searchBoxDecoration,
            showFlags: selectorConfig.showFlags,
            useEmoji: selectorConfig.useEmoji,
            autoFocus: autoFocusSearchField,
          ),
        ),
      ),
    );
  }

    /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.BOTTOM_SHEET] is selected
  showCountrySelectorBottomSheet(
      BuildContext context, List<Country> countries) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: isScrollControlled ?? true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          duration: const Duration(milliseconds: 100),
          child: Stack(children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
            ),
            DraggableScrollableSheet(
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).canvasColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: CountrySearchListWidget(
                    countries,
                    locale,
                    // searchBoxDecoration: searchBoxDecoration,
                    scrollController: controller,
                    showFlags: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    autoFocus: autoFocusSearchField,
                  ),
                );
              },
            ),
          ]),
        );
      },
    );
  }


}