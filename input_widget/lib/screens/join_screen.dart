import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {

  // state
  // 보통 클래스 내부에서 사용하는 데이터들은 변수명 앞에 _(언더 바)를 붙인다.
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwChkController = TextEditingController();
  String _gender = '남자';
  final TextEditingController _birthController = TextEditingController();
  String _idType = '주민등록증';
  final _formKey = GlobalKey<FormState>();

  // 달력
  // state
  List<DateTime?> _dateDefaultValue = [
    DateTime.now(),
  ];

  // 입력 날짜
  String _date = '';  // 2023/01/01 ~ 2023/01/05

  bool _isDateRangeSelected = false; // 날짜 범위가 선택되었는지 여부를 추적하기 위한 변수

  // 수량
  final TextEditingController _countController = TextEditingController(text: '1');  // 초기 값을 1로 지정
  int _count = 1;
  final int _maxCount = 100;  // 최댓값
  final int _minCount = 1;    // 최솟값

  // 달력 설정
  // 설정 정보
  final config = CalendarDatePicker2Config(
    // 캘린더 타입 : single, multi, range - 편도일 때는 single, 왕복일 때는 range
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: Colors.black,
    weekdayLabels: ['일', '월', '화', '수', '목', '금', '토'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 0,        // 시작 요일 : 0(일요일), 1(월요일)
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 3)))
          .isNegative,
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(
        children: [
          const Text('회원가입', style: TextStyle(fontSize: 30.0),),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // 아이디
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: '아이디',
                  ),
                  validator: (value) {
                    // 입력한 값을 value 매개 변수로 받아 확인한다.
                    if(value == null || value.isEmpty) {
                      return '아이디를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0,),

                // 비밀번호
                TextFormField(
                  controller: _pwController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                  ),
                  validator: (value) {
                    // 입력한 값을 value 매개 변수로 받아 확인한다.
                    if(value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0,),

                // 비밀번호 확인
                TextFormField(
                  controller: _pwChkController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '비밀번호 확인',
                  ),
                  validator: (value) {
                    // 입력한 값을 value 매개 변수로 받아 확인한다.
                    if(value == null || value.isEmpty) {
                      return '비밀번호 확인을 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0,),

                // 성별
                Row(
                  children: [
                    Text('성별'),
                    Radio(
                      value: '남자',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                    },),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _gender = '남자';
                        });
                      },
                      child: Text('남자'),
                    ),

                    Radio(
                      value: '여자',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                    },),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _gender = '여자';
                        });
                      },
                      child: Text('여자'),
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                ),

                // 생년월일
                Column(
                  children: [
                      TextFormField(
                        // initialValue: _birth.toString(),
                        controller: _birthController,
                        // readOnly: true,
                        decoration: InputDecoration(
                          labelText: '생년월일',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              picker.DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 1, 1),
                                maxTime: DateTime.now(),
                                theme: const picker.DatePickerTheme(
                                  // 헤더
                                  // headerColor: Colors.orange,
                                  // 배경
                                  // backgroundColor: Colors.blue,
                                  // 항목
                                  itemStyle: TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                    // 완료
                                    doneStyle:
                                    TextStyle(color: Colors.black, fontSize: 16)),
                                onChanged: (date) {
                                  print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  print('confirm $date');

                                  // 2023/01/01 이런 식으로 추출해보자
                                  var dateFormat = DateFormat('yyyy/MM/dd').format(date);
                                  _birthController.text = dateFormat;
                                },
                                currentTime: DateTime.now(), locale: picker.LocaleType.ko);
                            },
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return '생년월일을 입력하세요.';
                          }
                          return null;
                        },
                      ),
                      
                      // 신분증 종류
                      DropdownButtonFormField(
                        decoration: InputDecoration(labelText: '신분증 종류'),
                        value: _idType,
                        items: ['주민등록증', '운전면허증', '여권'].map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _idType = value!;
                          });
                        },
                      ),

                      // 달력
                      CalendarDatePicker2(
                        config: config,
                        value: _dateDefaultValue,
                        onValueChanged: (dates) {
                          // 이미 날짜 범위가 선택된 상태에서 한 번 더 선택하면 선택 취소
                          if (_isDateRangeSelected && dates != null && dates.length == 2) {
                            setState(() => _dateDefaultValue = []);
                            _isDateRangeSelected = false;
                            return;
                          }

                          setState(() => _dateDefaultValue = dates);
                          print('달력 날짜 : ${dates}');

                          if (dates != null && dates.length == 2) {
                            _isDateRangeSelected = true;
                            var start = DateFormat('yyyy/MM/dd').format(dates[0]!);
                            var end = DateFormat('yyyy/MM/dd').format(dates[1]!);
                            var date = '${start} ~ ${end}';
                            setState(() {
                              _date = date;
                            });
                          } else {
                            _isDateRangeSelected = false;
                          }
                        },
                      ),
                      
                      // 수량 
                      const Text('수량:'),
                      TextField(
                        textAlign: TextAlign.center,  // 텍스트 가운데 정렬
                        controller: _countController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: ElevatedButton(
                                        onPressed: () {
                                          if( _maxCount < _count ) {
                                            return;
                                          }
                                          setState(() {
                                            _count++;
                                          });                  
                                          _countController.text = _count.toString();
                                        }, 
                                        child: Text('+'),
                                      ),
                          suffixIcon: ElevatedButton(
                                        onPressed: () {
                                          if( _minCount >= _count ) {
                                            return;
                                          }
                                          setState(() {
                                            _count--;
                                          });                  
                                          _countController.text = _count.toString();
                                        }, 
                                        child: Text('-'),
                                      ),
                        ),
                        onChanged: (value) {
                          // int.parse("10") : String ➡ int 로 변환
                          // int.parse("")   : 빈 문자열을 int 변환하면 예외발생
                          // int.tryParse("숫자가아닌문자열") ➡ 예외 대신 null 로 반환
                          int newValue = int.tryParse(value) ?? -1;
                          // 값이 없을 때
                          if( newValue == -1 ) { 
                            setState(() { _count = 1; });
                            return; 
                          } 
                          if( newValue >= _maxCount ) {newValue = _maxCount;}
                          if( newValue < _minCount ) {newValue = _minCount;}
                          setState(() {
                            _count = newValue;
                          });
                          _countController.text = newValue.toString();
                        },
                      ),

                      // 회원 가입 버튼
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          // 데이터 요청
                          print('아이디 : ${_idController.text}');
                          print('비밀번호 : ${_pwController.text}');
                          print('비밀번호 확인 : ${_pwChkController.text}');
                          print('성별 : ${_gender}');
                          print('생년월일 : ${_birthController.text}');
                          print('신분증 종류 : ${_idType}');
                          print('선택 날짜 : ${_date}');
                          print('수량 : ${_countController.text}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        minimumSize: const Size(double.infinity, 40.0),
                      ),
                      child: const Text('회원가입'),

                    ),
                  ],
                ),

                
              ],
            ),
          )
        ]
      ),
    )
    
    ;
  }
}