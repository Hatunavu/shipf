library endpoint;

const getUser = "/api/users/2";

//auth
const verifyPhone = "/api/v2/verify-phone";
const verifyOTP = "/api/v2/verify-otp";
const login = "/authentication/sign-in";
const registerCustomer = '/users/register-customer';
const registerBusiness = '/users/register-business';
const registerShipper = '/users/register-shipper';
const deleteUser = '/users';

//address
const getProvinces = "/provinces";
const getDistricts = "/districts/get-by-province-id/{provinceId}";
const getWards = "/wards/get-by-district-id/{districtId}";
const getPickupAddresses = "/pickup-addresses";
const getDeliveryAddresses = "/delivery-addresses";

//order
const getOrderService = '/price-lists/quote';
const createOrder = '/shipments';
const getListOrder = '/shipments';
