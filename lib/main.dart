import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> countryImageMap = {
    // Mapping of country names to image file names
    "India": "in.png",
    "United States": "us.png",
    "Great Britain": "gb.png",
    "Albania": "al.png",
    "Argentina": "ar.png",
    "Afghanistan": "af.png",
    "Australia": "au.png",
    "South Africa": "za.png",
    "Pakistan": "pk.png",
    "Ireland": "ie.png",
    "Brazil": "br.png",
    "Wales": "gb-wls.png",
    "Finland": "fi.png",
    "Spain": "es.png",
    "South Korea": "kr.png",
    "Japan": "jp.png",
    "Jamaica": "jm.png",
    "Vietnam": "vn.png",
    "Canada": "ca.png",
    "Israel": "il.png",
    "Greenland": "gl.png",
    "Azerbaijan": "az.png",
    "Angola": "ao.png",
    "Belarus": "by.png",
    "Belgium": "be.png",
    "Belize": "bz.png",
    "Bermuda": "bm.png",
    "Botswana": "bw.png",
    "Bulgaria": "bg.png",
    "Cambodia": "kh.png",
    "Chad": "td.png",
    "Chile": "cl.png",
    "China": "cn.png",
    "Costa Rica": "cr.png",
    "Croatia": "hr.png",
    "Cuba": "cu.png",
    "Denmark": "dk.png",
    "Djibouti": "dj.png",
    "Ecuador": "ec.png",
    "Egypt": "eg.png",
    "El Salvador": "sv.png",
    "Ethiopia": "et.png",
    "Fiji": "fj.png",
    "France": "fr.png",
    "Georgia": "ge.png",
    "Germany": "de.png",
    "Greece": "gr.png",
    "Guadeloupe": "gp.png",
    "Honduras": "hn.png",
    "Hungary": "hu.png",
    "Indonesia": "id.png",
    "Iceland": "is.png",
    "Iran": "ir.png",
    "Iraq": "iq.png",
    "Italy": "it.png",
    "Jordan": "jo.png",
    "Kuwait": "kw.png",
    "Latvia": "lv.png",
    "Lebanon": "lb.png",
    "Liberia": "lr.png",
    "Lesotho": "ls.png",
    "Libya": "ly.png",
    "Lithuania": "lt.png",
    "Malaysia" : "my.png",
    "Maldives": "mv.png",
    "Malta": "mt.png",
    "Mexico": "mx.png",
    "Monaco": "mc.png",
    "Moldova": "md.png",
    "Mongolia": "mn.png",
    "Montenegro": "me.png",
    "Morocco": "ma.png",
    "Myanmar": "mm.png",
    "Nepal": "np.png",
    "Nigeria": "ng.png",
    "New Zealand": "nz.png",
    "Nicaragua": "ni.png",
    "Panama": "pa.png",
    "Paraguay": "py.png",
    "Philippines": "ph.png",
    "Poland": "pl.png",
    "Qatar": "qa.png",
    "Rwanda": "rw.png",
    "Russia": "ru.png",
    "Saint Lucia": "lc.png",


    // Add more country mappings here
  };

  String correctCountry = ""; // Track the correct country
  int currentScore = 0;

  void guessCountry(List<String> countries) {
    Random random = Random();
    int randIndex = random.nextInt(countries.length);
    correctCountry = countries[randIndex];
  }

  List<String> generateRandomCountryNames(int numCountries) {
    List<String> countryNames = countryImageMap.keys.toList();
    List<String> randomCountryNames = [];
    while (randomCountryNames.length < numCountries) {
      String randomCountry = countryNames[Random().nextInt(countryNames.length)];
      if (!randomCountryNames.contains(randomCountry)) {
        randomCountryNames.add(randomCountry);
      }
    }
    return randomCountryNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> randomCountryNames = generateRandomCountryNames(3);
    guessCountry(randomCountryNames);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guess The Flag!",
          style: TextStyle(
            fontFamily: "VinaSans",
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20), // Add spacing above the text
            Text(
              correctCountry,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Add spacing below the text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: randomCountryNames.map((countryName) {
                String imageName = countryImageMap[countryName] ?? "default.png";
                return Container(
                  width: 192,
                  height: 144,
                  child: IconButton(
                    onPressed: () {
                      if (countryName == correctCountry) {
                        print("Correct");
                        setState(() {
                          currentScore += 1;
                          randomCountryNames = generateRandomCountryNames(3);
                          guessCountry(randomCountryNames);
                        });
                      } else {
                        setState(() {
                          currentScore = 0;
                          randomCountryNames = generateRandomCountryNames(3);
                          guessCountry(randomCountryNames);
                        });
                      }
                    },
                    icon: Image.asset(
                      "images/$imageName",
                      width: 192,
                      height: 144,
                    ),
                  ),
                );
              }).toList(),
            ),
            // Add spacing and score display at the bottom
            SizedBox(height: 180),
            Align(
              alignment: Alignment.bottomLeft,
                child: Text(
                  "Score: $currentScore",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
