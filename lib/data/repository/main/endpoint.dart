library endpoint;

const getUser = "/api/users/2";

//auth
const verifyPhone = "/api/v2/verify-phone";
const verifyOTP = "/api/v2/verify-otp";
const login = "/authentication/sign-in";
const registerCustomer = '/users/register-customer';
const registerBusiness = '/users/register-business';
const registerShipper = '/users/register-shipper';

//address
const getProvinces = "/provinces";
const getDistricts = "/districts/get-by-province-id/{provinceId}";
const getWards = "/wards/get-by-district-id/{districtId}";
const getPickupAddresses = "/pickup-addresses";
const getDeliveryAddresses = "/delivery-addresses";

//order
const getOrderService =
    '/price-lists/quotes?pick_address_id={pickAddressId}&to_province_id={toProvinceId}&to_district_id={toDistrictId}&parcel_weight={parcelWeight}&parcel_quantity={parcelQuantity}&parcel_length={parcelLength}&parcel_width={parcelWidth}&parcel_height={parcelHeight}&parcel_value={parcelValue}&is_insured={isInsured}';
