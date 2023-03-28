//
//  HolidayDestinationViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//


import Foundation


struct Bild {
    let id: Int
    let name: String
    let imageName: String
}

class ReiseAuswahlViewModel: ObservableObject {
    @Published var reiseAuswahlModels: [ReiseAuswahlModel] = []
    @Published var feedbackList: [Feedback] = []
    @Published var bilder: [Bild] = [
          Bild(id: 1, name: "Roma", imageName: "Roma"),
          Bild(id: 2, name: "Paris", imageName: "Paris"),
          Bild(id: 3, name: "London", imageName: "London")
      ]
    
       @Published var selectedOption: String = ""
       @Published var savedOption: String = ""
      
    
    // Initialize the model
    init() {
        reiseAuswahlModels.append(
            ReiseAuswahlModel(
                name: "Deutschland",
                reise: """
**Ingredients**
    
    -Deutschland gehört geologisch zu Westeuropa, das heißt zu jenem Teil des Kontinents, der dem präkambrisch konsolidierten „Ur-Europa“ (Osteuropa einschließlich eines Großteils Skandinaviens, vgl. Baltica) erst im Verlauf des Phanerozoikums sukzessive durch Kontinent-Kontinent-Kollisionen (Gebirgsbildungen) angegliedert wurde. Die entsprechenden Krustenprovinzen (Grundgebirgsprovinzen) werden klassisch vereinfachend (Ost-)Avalonia (vgl. kaledonische Gebirgsbildung) und Armorica (vgl. variszische Gebirgsbildung) genannt. Die jüngste Krustenprovinz ist das Alpen-Karpaten-Orogen (vgl. alpidische Gebirgsbildung), an dem Deutschland nur mit dem äußersten Süden Bayerns Anteil hat und das im Gegensatz zu den beiden anderen tektonischen Provinzen ein aktives Orogen darstellt
""",
                reiseImage: "brandenburger_tor",
                reiseURL: "https://www.visitberlin.de/de")
        )
        
        reiseAuswahlModels.append(
            ReiseAuswahlModel(
                name: "Frankreich",
                reise: """
**Ingredients**

- 1 1/2 cups (355 ml) warm water (105°F-115°F)
- 1 package (2 1/4 teaspoons) active dry yeast
- 3 3/4 cups (490g) bread flour
- 2 tablespoons extra virgin olive oil (omit if cooking pizza in a wood-fired pizza oven)
- 2 teaspoons kosher salt
- 1 teaspoon sugar
- Extra virgin olive oil
- Cornmeal (to help slide the pizza onto the pizza stone)
- Tomato sauce (smooth or pureed)
- Firm mozzarella cheese, grated
- Fresh soft mozzarella cheese, separated into small clumps
- Fontina cheese, grated
""",
                reiseImage: "eiffel_tower",
                reiseURL: "https://www.billetseiffel.fr/de/?msclkid=cbf85528d7bc14c642c631290db72737&utm_source=bing&utm_medium=cpc&utm_campaign=Paris%20-%20Eiffel%20Tower%20-%20German%20-%20Rest%20of%20World%20-%20Search%20-%20All%20-%20All%20-%20cid243&utm_term=eifelturm&utm_content=Generic%20-%20Exact%20-%20German%20-%20All")
        )
        
        
        reiseAuswahlModels.append(
            ReiseAuswahlModel(
                name: "USA",
                reise: """
**Ingredients**
- granulated sugar, only 3 tablespoons for the whole pie!
- thinly sliced apples, it'll take about 8-10 medium apples
- just a bit of butter and cinnamon
- Double pie crust
""",
                reiseImage: "grand_canyon",
                reiseURL: "https://www.getyourguide.de/-l489/-tc1146/?cmp=bing&campaign_id=434111595&adgroup_id=1249045831593126&target_id=dat-2329865139485940%3Aloc-72&match_type=b&ad_id=78065524509528&msclkid=59c48ad067361d28ff39eed1bd4df689&loc_physical_ms=127417&feed_item_id=&keyword=www.getyourguide.de&partner_id=CD951&utm_medium=paid_search&utm_source=bing&utm_campaign=ct%3Ddsa%7Cln%3D39%3Ade%7Ctc%3Dall&utm_term=www.getyourguide.de&gclsrc=3p.ds")
        )
        
        reiseAuswahlModels.append(
            ReiseAuswahlModel(
                name: "China",
                reise: """
**Ingredients**

- 1 (15-ounce) can chickpeas or 1 ½ cups (250 grams) cooked chickpeas
- 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
- 1/4 cup (60 ml) well-stirred tahini, see our homemade tahini recipe
- 1 small garlic clove, minced
- 2 tablespoons (30 ml) extra-virgin olive oil, plus more for serving
- 1/2 teaspoon ground cumin
- Salt to taste
- 2 to 3 tablespoons (30 to 45 ml) water or aquafaba
- Dash ground paprika or sumac

""",
                reiseImage: "great_wall_of_china",
                reiseURL: "https://www.expedia.de/en/Great-Wall-Of-China-Hotels.0-l6095764-0.Travel-Guide-Filter-Hotels?semcid=DE.UB.BING.DL-DSA-c-EN.HOTEL&semdtl=a1414243022.b11329310728883903.r1.g1dat-2334881661101981:loc-72.i1.d1.e1c.j1127417.k1.f1.n1.l1o.h1b.m1&msclkid=7e990b6d6dbb1228c2356f6cb712a7de")
        )
        
        
        
        
    }
    
    
    func getBildById(_ id: Int) -> Bild? {
        return bilder.first { $0.id == id }
    }
  
  func saveFlight() {
          savedOption = selectedOption
      }
  
  
  func addFeedback(title: String, text: String) {
          let feedback = Feedback(title: title, text: text)
          feedbackList.append(feedback)
      }
  func updateFeedback(feedback: Feedback) {
      guard let index = feedbackList.firstIndex(where: { $0.id == feedback.id }) else {
          return
      }
      
      feedbackList[index] = feedback
  }

  func deleteFeedback(feedback: Feedback) {
      feedbackList.removeAll(where: { $0.id == feedback.id })
  }
}
