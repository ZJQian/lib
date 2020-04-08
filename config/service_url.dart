const baseUrlGank = 'http://gank.io/api';
//app_id:qgmkqmgifdrhrlkj   app_secret:VVRQU1BrTTdEcWdDTGM1VklkUUs3UT09
const baseUrlMxnzp = 'https://www.mxnzp.com/api';

const baseUrlDouban = "https://api.douban.com";

//获取最新一天的干货
String gankToday = baseUrlGank + "/today";
//搜索
String gankSearch = baseUrlGank + "/search/query";
//彩种
String lotteryTypes = baseUrlMxnzp + "/lottery/common/types";
//获取最新通用中奖号码信息
String lotteryLatest = baseUrlMxnzp + "/lottery/common/latest";
//单一二维码
String qrcodeSingle = baseUrlMxnzp + "/qrcode/create/single";
//带logo二维码
String qrcodeLogo = baseUrlMxnzp + "/qrcode/create/logo";
//福利
String welfare = baseUrlMxnzp + "/image/girl/list";
//豆瓣top250
String doubanTop250 = baseUrlDouban + "/v2/movie/top250";
