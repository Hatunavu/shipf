library endpoint;

const getUser = "/api/users/2";

//auth
const verifyPhone = "/api/v2/verify-phone";
const verifyOTP = "/api/v2/verify-otp";
const login = "/api/v2/auth/sign-in";
const register = '/api/v2/user/register-customer';

//address
const getProvinces = "/provinces";
const getDistricts = "/districts?province_id={provinceId}";
const getWards = "/wards?district_id={districtId}";
