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
const postDeviceToken = '/devices';
const forgetPass = '/authentication/forgot-password';

//address
const getProvinces = "/provinces";
const getDistricts = "/districts/get-by-province-id/{provinceId}";
const getWards = "/wards/get-by-district-id/{districtId}";
const getPickupAddresses = "/pickup-addresses";
const getDeliveryAddresses = "/delivery-addresses";

//order
const getOrderService = '/price-lists/quote';
const createOrder = '/shipments';
const updateOrder = '/shipments/{shipmentId}';
const updateOrderStatus = '/shipments/update-status-tracking/{orderId}';

//account
const getUserInfo = '/users/information';

//shipment
const getShipments = '/shipments';
const getShipmentDetail = '/shipments/{shipmentId}';
const getShipmentSummary = '/shipments/get-summary';
const updateShipmentStatus = '/shipments/update-shipment-status-trackings';

//transit
const getTransits = '/transits';
const getTransitDetail = '/transits/{transitId}';
const getTransitSummary = '/transits/get-summary';
const acceptTransit = '/transits/accept/{transitId}';
const cancelTransit = '/transits/cancel/{transitId}';

//token
const sendDeviceToken = '/device';

//post
const getPost = '/express/post';
const createPost = '/express/post';
const getPostSaved = '/express/post/saved';
const updatePost = '/express/post/{id}';
