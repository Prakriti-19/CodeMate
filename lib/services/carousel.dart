class CarouselModel{
  String image;
  CarouselModel(this.image);

}
List<CarouselModel> carousels= carouselData.map((item)=>CarouselModel(item['image']??'')).toList();
var carouselData=[
  {"image": "images/codechef.png"},
  {"image": "images/hackerearth.png"},
  {"image": "images/codeforces.png"}
];
 var linkData=[
  "https://www.codechef.com/contests?itm_medium=navmenu&itm_campaign=allcontests",
  "https://www.hackerearth.com/challenges/",
  "https://codeforces.com/contests"
];