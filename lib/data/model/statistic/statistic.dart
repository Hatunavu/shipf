class Statistic {
  final String content;
  final String data;

  Statistic({this.content = '', this.data = ''});
}

class HomeAction {
  final String content;
  final String icon;
  final Function()? onTap;

  HomeAction({this.content = '', this.icon = '', this.onTap});
}
