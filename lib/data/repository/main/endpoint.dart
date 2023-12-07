library endpoint;

const getUser = "/api/users/2";

//auth
const verifyPhone = "/api/v2/verify-phone";
const verifyOTP = "/api/v2/verify-otp";
const login = "/api/v2/auth/sign-in";
const register = '/api/v2/user/register-customer';
const registerBusiness = '/api/v2/user/register-business';

//address
const getProvinces = "/provinces?size=100";
const getDistricts = "/districts?province_id={provinceId}&size=100";
const getWards = "/wards?district_id={districtId}&size=100";

//order
const getOrderService =
    '/price-lists/quotes?pick_address_id={pickAddressId}&to_province_id={toProvinceId}&to_district_id={toDistrictId}&parcel_weight={parcelWeight}&parcel_quantity={parcelQuantity}&parcel_length={parcelLength}&parcel_width={parcelWidth}&parcel_height={parcelHeight}&parcel_value={parcelValue}&is_insured={isInsured}';
