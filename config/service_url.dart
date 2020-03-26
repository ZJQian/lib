const baseUrlGank = 'http://gank.io/api';
//app_id:qgmkqmgifdrhrlkj   app_secret:VVRQU1BrTTdEcWdDTGM1VklkUUs3UT09
const baseUrlMxnzp = 'https://www.mxnzp.com/api';

//获取最新一天的干货
String gankToday = baseUrlGank + "/today";
//搜索
String gankSearch = baseUrlGank + "/search/query";
//彩种
String lotteryTypes = baseUrlMxnzp + "/lottery/common/types";
//获取最新通用中奖号码信息
String lotteryLatest = baseUrlMxnzp + "/lottery/common/latest";
