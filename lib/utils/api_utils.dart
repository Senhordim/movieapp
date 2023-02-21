class API {
  static String requestIMG(String imgPath) =>
      'https://image.tmdb.org/t/p/w500/$imgPath';

  static const requestMovieList = 'list/1?page=1';
}
