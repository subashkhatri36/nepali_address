# Nepali Address
[![Pub](https://img.shields.io/pub/v/nepali_address)](https://pub.dev/packages/nepali_address) 
[![licence](https://img.shields.io/badge/Licence-MIT-orange.svg)](https://github.com/subashkhatri36/nepali_address/blob/main/LICENSE) 

Address of Nepal followed by Province, district, municipality and ward.

## Picture
![english_example](https://github.com/subashkhatri36/nepali_address/blob/main/example/assets/english.png?raw=true)
![nepali_example](https://github.com/subashkhatri36/nepali_address/blob/main/example/assets/nepali.png?raw=true)

## Access only list of address

```dart
Address address = addressList;
```

## AddressContainer 
Flutter widget to get whole address bloc

```dart
 AddressContainer(
              isRoundedBorder: true,
              selectDistrict: (String district) {
                fullAddress.add('District ' + district);
              },
              selectProvince: (String province) {
                fullAddress.clear();
                fullAddress.add('\n Province ' + province);
              },
              selectMunicipality: (String municipality) {
                fullAddress.add('\n Municipality ' + municipality);
              },
              wardController: wardController,
              isNepali: false,
            ),
```

Just Add  'isNepali: true', parameters to enable nepali font.
```dart
 AddressContainer(
              ...
              isNepali: false,
            ),
```

## You can also access individual widget component

for example:
```dart

   AddressWidget<Province>(
              isNepali: true,
              list: addressList.province,
              value: _province,
              hint: widget.isNepali ? 'प्रदेश' : 'Province',
              onChanged: selectPlace,
              isRoundedBorder: true,
              padding:  EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              borderColor: Colors.blue,
            ),



    void selectPlace(Province? place) {
        if (place == null) {
        return;
        }
        _province = place;       
        setState(() {});
  }

```

## License
```
Copyright 2022 Subash Khatri. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```