import 'package:sign_writing/settings.dart';
import 'package:sign_writing/widgets/game_tile.dart';

List<Tile> tiles = [];
int currentGroup;

class GroupItem {
  final String type;
  final String value;

  GroupItem(this.type, this.value);
}

class Group {
  final String name;
  final List<GroupItem> entries;
  
  const Group(this.name, this.entries);
}

class LocalizedCategory {
  final Map<String, List<Group>> groups;

  List<Group> localize() {
    return groups[SystemSettings.language];
  }

  LocalizedCategory(this.groups);
}

Map mapCategories = {
  "EXAMPLE": categoryExample,
  "BASIC": categoryBasics,
  "NUMBERS": categoryNumbers,
  "LETTERS": categoryLetters,
  "OTHER": categoryOthers
}; 

LocalizedCategory categoryExample = LocalizedCategory(
  { 
    'en': [Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])],
    'de': [Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])],
    'es': [Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])],
  }
);

LocalizedCategory categoryBasics = LocalizedCategory(
  {
    'en':  [
            Group("auto", [GroupItem("Video", "assets/videos/auto.mp4"), GroupItem("Image", "images/ic_image101.jpg"), GroupItem("Image", "images/ic_image201.jpg")]),
            Group("kaffee", [GroupItem("Video", "assets/videos/kaffee.mp4"), GroupItem("Image", "images/ic_image103.jpg"), GroupItem("Image", "images/ic_image203.jpg")]),
            Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])
          ],
    'de': [
            Group("auto", [GroupItem("Video", "assets/videos/auto.mp4"), GroupItem("Image", "images/ic_image101.jpg"), GroupItem("Image", "images/ic_image201.jpg")]),
            Group("kaffee", [GroupItem("Video", "assets/videos/kaffee.mp4"), GroupItem("Image", "images/ic_image103.jpg"), GroupItem("Image", "images/ic_image203.jpg")]),
            Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])
          ],
    'es': [
            Group("auto", [GroupItem("Video", "assets/videos/auto.mp4"), GroupItem("Image", "images/ic_image101.jpg"), GroupItem("Image", "images/ic_image201.jpg")]),
            Group("kaffee", [GroupItem("Video", "assets/videos/kaffee.mp4"), GroupItem("Image", "images/ic_image103.jpg"), GroupItem("Image", "images/ic_image203.jpg")]),
            Group("baum", [GroupItem("Video", "assets/videos/baum.mp4"), GroupItem("Image", "images/ic_image102.jpg"), GroupItem("Image", "images/ic_image202.jpg")])
          ]
  }
);

LocalizedCategory categoryNumbers = LocalizedCategory(
  {
    'en': [],
    'de': [
            Group("1", [GroupItem("Video", "assets/videos/1.mp4"),GroupItem("Image", "images/1.png"),GroupItem("Text", "1")]),
            Group("2", [GroupItem("Video", "assets/videos/2.mp4"), GroupItem("Image", "images/2.png"), GroupItem("Text", "2")]),
            Group("3", [GroupItem("Video", "assets/videos/3.mp4"), GroupItem("Image", "images/3.png"), GroupItem("Text", "3")]),
            Group("4", [GroupItem("Video", "assets/videos/4.mp4"), GroupItem("Image", "images/4.png"), GroupItem("Text", "4")]),
            Group("5", [GroupItem("Video", "assets/videos/5.mp4"), GroupItem("Image", "images/5.png"), GroupItem("Text", "5")]),
            Group("6", [GroupItem("Video", "assets/videos/6.mp4"), GroupItem("Image", "images/6.png"), GroupItem("Text", "6")]),
            Group("7", [GroupItem("Video", "assets/videos/7.mp4"), GroupItem("Image", "images/7.png"), GroupItem("Text", "7")]),
            Group("8", [GroupItem("Video", "assets/videos/8.mp4"), GroupItem("Image", "images/8.png"), GroupItem("Text", "8")]),
            Group("9", [GroupItem("Video", "assets/videos/9.mp4"), GroupItem("Image", "images/9.png"), GroupItem("Text", "9")]),
            Group("10", [GroupItem("Video", "assets/videos/10.mp4"), GroupItem("Image", "images/10.png"), GroupItem("Text", "10")]),
            Group("11", [GroupItem("Video", "assets/videos/11.mp4"), GroupItem("Image", "images/11.png"), GroupItem("Text", "11")]),
            Group("12", [GroupItem("Video", "assets/videos/12.mp4"), GroupItem("Image", "images/12.png"), GroupItem("Text", "12")]),
            Group("13", [GroupItem("Video", "assets/videos/13.mp4"), GroupItem("Image", "images/13.png"), GroupItem("Text", "13")]),
            Group("14", [GroupItem("Video", "assets/videos/14.mp4"), GroupItem("Image", "images/14.png"), GroupItem("Text", "14")]),
            Group("15", [GroupItem("Video", "assets/videos/15.mp4"), GroupItem("Image", "images/15.png"), GroupItem("Text", "15")]),
            Group("16", [GroupItem("Video", "assets/videos/16.mp4"), GroupItem("Image", "images/16.png"), GroupItem("Text", "16")]),
            Group("20", [GroupItem("Video", "assets/videos/20.mp4"), GroupItem("Image", "images/20.png"), GroupItem("Text", "20")]),
            Group("21", [GroupItem("Video", "assets/videos/21.mp4"), GroupItem("Image", "images/21.png"), GroupItem("Text", "21")]),
            Group("22", [GroupItem("Video", "assets/videos/22.mp4"), GroupItem("Image", "images/22.png"), GroupItem("Text", "22")]),
            Group("24", [GroupItem("Video", "assets/videos/24.mp4"), GroupItem("Image", "images/24.png"), GroupItem("Text", "24")]),
            Group("30", [GroupItem("Video", "assets/videos/30.mp4"), GroupItem("Image", "images/30.png"), GroupItem("Text", "30")]),
            Group("33", [GroupItem("Video", "assets/videos/33.mp4"), GroupItem("Image", "images/33.png"), GroupItem("Text", "33")]),
            Group("40", [GroupItem("Video", "assets/videos/40.mp4"), GroupItem("Image", "images/40.png"), GroupItem("Text", "40")]),
            Group("50", [GroupItem("Video", "assets/videos/50.mp4"), GroupItem("Image", "images/50.png"), GroupItem("Text", "50")]),
            Group("60", [GroupItem("Video", "assets/videos/60.mp4"), GroupItem("Image", "images/60.png"), GroupItem("Text", "60")]),
            Group("100", [GroupItem("Video", "assets/videos/100.mp4"), GroupItem("Image", "images/100.png"), GroupItem("Text", "100")]),
            Group("200", [GroupItem("Video", "assets/videos/200.mp4"), GroupItem("Image", "images/200.png"), GroupItem("Text", "200")]),
            Group("1000", [GroupItem("Video", "assets/videos/1000.mp4"), GroupItem("Image", "images/1000.png"), GroupItem("Text", "1000")]),
            Group("2000", [GroupItem("Video", "assets/videos/2000.mp4"), GroupItem("Image", "images/2000.png"), GroupItem("Text", "2000")]),
            // Group("1.452.345", [GroupItem("Video", "assets/videos/1.452.345.mp4"),GroupItem("Image", "images/1.452.345.png"),GroupItem("Text", "1.452.345")]),
          ],
    'es': []
  }
);

LocalizedCategory categoryLetters = LocalizedCategory(
  {
    'en': [],
    'de': [
            Group("a", [GroupItem("Video", "assets/videos/a.mp4"), GroupItem("Image", "images/A.png"), GroupItem("Text", "a")]),
            Group("b", [GroupItem("Video", "assets/videos/b.mp4"), GroupItem("Image", "images/B.png"), GroupItem("Text", "b")]),
            Group("c", [GroupItem("Video", "assets/videos/c.mp4"), GroupItem("Image", "images/C.png"), GroupItem("Text", "c")]),
            Group("d", [GroupItem("Video", "assets/videos/d.mp4"), GroupItem("Image", "images/D.png"), GroupItem("Text", "d")]),
            Group("e", [GroupItem("Video", "assets/videos/e.mp4"), GroupItem("Image", "images/E.png"), GroupItem("Text", "e")]),
            Group("f", [GroupItem("Video", "assets/videos/f.mp4"), GroupItem("Image", "images/F.png"), GroupItem("Text", "f")]),
            Group("g", [GroupItem("Video", "assets/videos/g.mp4"), GroupItem("Image", "images/G.png"), GroupItem("Text", "g")]),
            Group("h", [GroupItem("Video", "assets/videos/h.mp4"), GroupItem("Image", "images/H.png"), GroupItem("Text", "h")]),
            Group("i", [GroupItem("Video", "assets/videos/i.mp4"), GroupItem("Image", "images/I.png"), GroupItem("Text", "i")]),
            Group("j", [GroupItem("Video", "assets/videos/j.mp4"), GroupItem("Image", "images/J.png"), GroupItem("Text", "j")]),
            Group("k", [GroupItem("Video", "assets/videos/k.mp4"), GroupItem("Image", "images/K.png"), GroupItem("Text", "k")]),
            Group("l", [GroupItem("Video", "assets/videos/l.mp4"), GroupItem("Image", "images/L.png"), GroupItem("Text", "l")]),
            Group("m", [GroupItem("Video", "assets/videos/m.mp4"), GroupItem("Image", "images/M.png"), GroupItem("Text", "m")]),
            Group("n", [GroupItem("Video", "assets/videos/n.mp4"), GroupItem("Image", "images/N.png"), GroupItem("Text", "n")]),
            Group("o", [GroupItem("Video", "assets/videos/o.mp4"), GroupItem("Image", "images/O.png"), GroupItem("Text", "o")]),
            Group("p", [GroupItem("Video", "assets/videos/p.mp4"), GroupItem("Image", "images/P.png"), GroupItem("Text", "p")]),
            Group("q", [GroupItem("Video", "assets/videos/q.mp4"), GroupItem("Image", "images/Q.png"), GroupItem("Text", "q")]),
            Group("r", [GroupItem("Video", "assets/videos/r.mp4"), GroupItem("Image", "images/R.png"), GroupItem("Text", "r")]),
            Group("s", [GroupItem("Video", "assets/videos/s.mp4"), GroupItem("Image", "images/S.png"), GroupItem("Text", "s")]),
            Group("t", [GroupItem("Video", "assets/videos/t.mp4"), GroupItem("Image", "images/T.png"), GroupItem("Text", "t")]),
            Group("u", [GroupItem("Video", "assets/videos/u.mp4"), GroupItem("Image", "images/U.png"), GroupItem("Text", "u")]),
            Group("v", [GroupItem("Video", "assets/videos/v.mp4"), GroupItem("Image", "images/V.png"), GroupItem("Text", "v")]),
            Group("w", [GroupItem("Video", "assets/videos/w.mp4"), GroupItem("Image", "images/W.png"), GroupItem("Text", "w")]),
            Group("x", [GroupItem("Video", "assets/videos/x.mp4"), GroupItem("Image", "images/X.png"), GroupItem("Text", "x")]),
            Group("y", [GroupItem("Video", "assets/videos/y.mp4"), GroupItem("Image", "images/Y.png"), GroupItem("Text", "y")]),
            Group("z", [GroupItem("Video", "assets/videos/z.mp4"), GroupItem("Image", "images/Z.png"), GroupItem("Text", "z")]),
            Group("ß", [GroupItem("Video", "assets/videos/sz.mp4"), GroupItem("Image", "images/sz.png"), GroupItem("Text", "ß")]),
            Group("ä", [GroupItem("Video", "assets/videos/ae.mp4"), GroupItem("Image", "images/ae.png"), GroupItem("Text", "ä")]),
            Group("ö", [GroupItem("Video", "assets/videos/oe.mp4"), GroupItem("Image", "images/oe.png"), GroupItem("Text", "ö")]),
            Group("ü", [GroupItem("Video", "assets/videos/ue.mp4"), GroupItem("Image", "images/ue.png"), GroupItem("Text", "ü")]),
          ],
    'es': []
  }
);

LocalizedCategory categoryOthers = LocalizedCategory(
  {
    'en': [],
    'de': [
              // //  Group("nervoes", [GroupItem("Video", "assets/videos/nervoes.mp4"), GroupItem("Image", "images/nervoes.png"), GroupItem("Text", "nervoes")]),	
            // Group( "supermarkt", [GroupItem("Video", "assets/videos/supermarkt.mp4"), GroupItem("Image", "images/supermarkt.png"), GroupItem("Text", "supermarkt")]),	
            // Group("aldi", [GroupItem("Video", "assets/videos/aldi.mp4"), GroupItem("Image", "images/aldi.png"), GroupItem("Text", "aldi")]),	
            // Group("cent", [GroupItem("Video", "assets/videos/cent.mp4"), GroupItem("Image", "images/cent.png"), GroupItem("Text", "cent")]),	
            // Group("deprimiert", [GroupItem("Video", "assets/videos/deprimiert.mp4"), GroupItem("Image", "images/deprimiert.png"), GroupItem("Text", "deprimiert")]),	
            // Group("eifersüchtig", [GroupItem("Video", "assets/videos/eifersüchtig.mp4"), GroupItem("Image", "images/eifersüchtig.png"), GroupItem("Text", "eifersüchtig")]),	
            // Group("einzelkind", [GroupItem("Video", "assets/videos/einzelkind.mp4"), GroupItem("Image", "images/einzelkind.png"), GroupItem("Text", "einzelkind")]),	
            // Group("eltern", [GroupItem("Video", "assets/videos/eltern.mp4"), GroupItem("Image", "images/eltern.png"), GroupItem("Text", "eltern")]),	
            // Group("enkel", [GroupItem("Video", "assets/videos/enkel.mp4"), GroupItem("Image", "images/enkel.png"), GroupItem("Text", "enkel")]),	
            // Group("familie", [GroupItem("Video", "assets/videos/familie.mp4"), GroupItem("Image", "images/familie.png"), GroupItem("Text", "familie")]),	
            // Group("fleißig", [GroupItem("Video", "assets/videos/fleißig.mp4"), GroupItem("Image", "images/fleißig.png"), GroupItem("Text", "fleißig")]),	
            // Group("fröhlich", [GroupItem("Video", "assets/videos/fröhlich.mp4"), GroupItem("Image", "images/fröhlich.png"), GroupItem("Text", "fröhlich")]),	
            // Group("gemein", [GroupItem("Video", "assets/videos/gemein.mp4"), GroupItem("Image", "images/gemein.png"), GroupItem("Text", "gemein")]),	
            // Group("Geschäft", [GroupItem("Video", "assets/videos/Geschäft.mp4"), GroupItem("Image", "images/Geschäft.png"), GroupItem("Text", "Geschäft")]),	
            // Group("geschwister", [GroupItem("Video", "assets/videos/geschwister.mp4"), GroupItem("Image", "images/geschwister.png"), GroupItem("Text", "geschwister")]),	
            // Group("glücklich", [GroupItem("Video", "assets/videos/glücklich.mp4"), GroupItem("Image", "images/glücklich.png"), GroupItem("Text", "glücklich")]),	
            // Group("lidl", [GroupItem("Video", "assets/videos/lidl.mp4"), GroupItem("Image", "images/lidl.png"), GroupItem("Text", "lidl")]),	
            // Group("muenze", [GroupItem("Video", "assets/videos/muenze.mp4"), GroupItem("Image", "images/muenze.png"), GroupItem("Text", "muenze")]),	
            // Group("naiv", [GroupItem("Video", "assets/videos/naiv.mp4"), GroupItem("Image", "images/naiv.png"), GroupItem("Text", "naiv")]),	
            // Group("onkel", [GroupItem("Video", "assets/videos/onkel.mp4"), GroupItem("Image", "images/onkel.png"), GroupItem("Text", "onkel")]),	
            // Group("rechnungsbeleg", [GroupItem("Video", "assets/videos/rechnungsbeleg.mp4"), GroupItem("Image", "images/rechnungsbeleg.png"), GroupItem("Text", "rechnungsbeleg")]),	
            // Group("schüchtern", [GroupItem("Video", "assets/videos/schüchtern.mp4"), GroupItem("Image", "images/schüchtern.png"), GroupItem("Text", "schüchtern")]),	
            // Group("waren", [GroupItem("Video", "assets/videos/waren.mp4"), GroupItem("Image", "images/waren.png"), GroupItem("Text", "waren")]),	
            // Group("zufrieden", [GroupItem("Video", "assets/videos/zufrieden.mp4"), GroupItem("Image", "images/zufrieden.png"), GroupItem("Text", "zufrieden")]),	
            Group("baby", [GroupItem("Video", "assets/videos/baby.mp4"), GroupItem("Image", "images/baby.png"), GroupItem("Text", "baby")]),	
            Group("Bruder", [GroupItem("Video", "assets/videos/Bruder.mp4"), GroupItem("Image", "images/Bruder.png"), GroupItem("Text", "Bruder")]),	
            Group("dumm", [GroupItem("Video", "assets/videos/dumm.mp4"), GroupItem("Image", "images/dumm.png"), GroupItem("Text", "dumm")]),	
            Group("ehrlich", [GroupItem("Video", "assets/videos/ehrlich.mp4"), GroupItem("Image", "images/ehrlich.png"), GroupItem("Text", "ehrlich")]),	
            Group("einkaufswagen", [GroupItem("Video", "assets/videos/einkaufswagen.mp4"), GroupItem("Image", "images/einkaufswagen.png"), GroupItem("Text", "einkaufswagen")]),	
            Group("empfindlich", [GroupItem("Video", "assets/videos/empfindlich.mp4"), GroupItem("Image", "images/empfindlich.png"), GroupItem("Text", "empfindlich")]),	
            Group("euro", [GroupItem("Video", "assets/videos/euro.mp4"), GroupItem("Image", "images/euro.png"), GroupItem("Text", "euro")]),	
            Group("faul", [GroupItem("Video", "assets/videos/faul.mp4"), GroupItem("Image", "images/faul.png"), GroupItem("Text", "faul")]),	
            Group("frech", [GroupItem("Video", "assets/videos/frech.mp4"), GroupItem("Image", "images/frech.png"), GroupItem("Text", "frech")]),	
            Group("freundlich", [GroupItem("Video", "assets/videos/freundlich.mp4"), GroupItem("Image", "images/freundlich.png"), GroupItem("Text", "freundlich")]),	
            Group("geduldig", [GroupItem("Video", "assets/videos/geduldig.mp4"), GroupItem("Image", "images/geduldig.png"), GroupItem("Text", "geduldig")]),	
            Group("geld", [GroupItem("Video", "assets/videos/geld.mp4"), GroupItem("Image", "images/geld.png"), GroupItem("Text", "geld")]),	
            Group("halbschwester", [GroupItem("Video", "assets/videos/halbschwester.mp4"), GroupItem("Image", "images/halbschwester.png"), GroupItem("Text", "halbschwester")]),	
            Group("kasse", [GroupItem("Video", "assets/videos/kasse.mp4"), GroupItem("Image", "images/kasse.png"), GroupItem("Text", "kasse")]),	
            Group("kind", [GroupItem("Video", "assets/videos/kind.mp4"), GroupItem("Image", "images/kind.png"), GroupItem("Text", "kind")]),	
            Group("kinder", [GroupItem("Video", "assets/videos/kinder.mp4"), GroupItem("Image", "images/kinder.png"), GroupItem("Text", "kinder")]),	
            Group("klug", [GroupItem("Video", "assets/videos/klug.mp4"), GroupItem("Image", "images/klug.png"), GroupItem("Text", "klug")]),	
            Group("kunde", [GroupItem("Video", "assets/videos/kunde.mp4"), GroupItem("Image", "images/kunde.png"), GroupItem("Text", "kunde")]),	
            Group("Laden", [GroupItem("Video", "assets/videos/Laden.mp4"), GroupItem("Image", "images/Laden.png"), GroupItem("Text", "Laden")]),	
            Group("lebensmittel", [GroupItem("Video", "assets/videos/lebensmittel.mp4"), GroupItem("Image", "images/lebensmittel.png"), GroupItem("Text", "lebensmittel")]),	
            Group("lieb", [GroupItem("Video", "assets/videos/lieb.mp4"), GroupItem("Image", "images/lieb.png"), GroupItem("Text", "lieb")]),	
            Group("mama", [GroupItem("Video", "assets/videos/mama.mp4"), GroupItem("Image", "images/mama.png"), GroupItem("Text", "mama")]),	
            Group("Markt", [GroupItem("Video", "assets/videos/Markt.mp4"), GroupItem("Image", "images/Markt.png"), GroupItem("Text", "Markt")]),	
            Group("neugierig", [GroupItem("Video", "assets/videos/neugierig.mp4"), GroupItem("Image", "images/neugierig.png"), GroupItem("Text", "neugierig")]),	
            Group("niedlich", [GroupItem("Video", "assets/videos/niedlich.mp4"), GroupItem("Image", "images/niedlich.png"), GroupItem("Text", "niedlich")]),	
            Group("papa", [GroupItem("Video", "assets/videos/papa.mp4"), GroupItem("Image", "images/papa.png"), GroupItem("Text", "papa")]),	
            Group("peinlich", [GroupItem("Video", "assets/videos/peinlich.mp4"), GroupItem("Image", "images/peinlich.png"), GroupItem("Text", "peinlich")]),	
            Group("Preis", [GroupItem("Video", "assets/videos/Preis.mp4"), GroupItem("Image", "images/Preis.png"), GroupItem("Text", "Preis")]),	
            Group("Rechnung", [GroupItem("Video", "assets/videos/Rechnung.mp4"), GroupItem("Image", "images/Rechnung.png"), GroupItem("Text", "Rechnung")]),	
            Group("sohn", [GroupItem("Video", "assets/videos/sohn.mp4"), GroupItem("Image", "images/sohn.png"), GroupItem("Text", "sohn")]),	
            Group("stiefbruder", [GroupItem("Video", "assets/videos/stiefbruder.mp4"), GroupItem("Image", "images/stiefbruder.png"), GroupItem("Text", "stiefbruder")]),	
            Group("stolz", [GroupItem("Video", "assets/videos/stolz.mp4"), GroupItem("Image", "images/stolz.png"), GroupItem("Text", "stolz")]),	
            Group("stur", [GroupItem("Video", "assets/videos/stur.mp4"), GroupItem("Image", "images/stur.png"), GroupItem("Text", "stur")]),	
            Group("verliebt", [GroupItem("Video", "assets/videos/verliebt.mp4"), GroupItem("Image", "images/verliebt.png"), GroupItem("Text", "verliebt")])
          ],
    'es': []
  }
);