class ServerAddresses {
  //Server address of your project should go here
  static const testServerAddress = "http://40.123.194.215:5002/api/";
  static const serverAddress = '40.123.194.215:5002';
  static const authToken = 'wp-json/jwt-auth/v1/token';
  static const merchantId = "3fa85f64-5717-4562-b3fc-2c963f66afa6";
  //user
  static const login = 'user/Login/';
  static const forgotPassword = '/user/SendForgotPasswordLink';
  static const userCreate = '/user/Create';
  static const resetPassword = '/user/ResetPassword/';
  static const userValidate = '/user/Validate/';
  static const sendRegistrationOTP = 'user/SendRegistrationOTP/';
  static const validateRegistrationOTP = '/user/ValidateRegistrationOTP/';
  static const validateForgotPasswordOTP = '/user/ValidateForgotPasswordOTP/';
  static const userActivate = '/user/Activate/';
  static const existingUser = '/user/GetExistigUserByMobile/';
  static const saveDocuments = '/user/SaveDocuments/';
  static const saveBankDetails = '/api/user/SaveBankDetails/';
  static const sendActivationLink = '/user/SendActivationLink/';
  static const userGet = '/user/Get/';
  static const userByUserId = '/user/ByUserId/';
  static const userUpdate = '/user/Update/';
  static const userStatusUpdate = '/user/StatusUpdate/';
  static const userPackages = '/user/Packages/';
  static const addressCreate = '/user/Address/Create/';
  static const addressDefault = '/user/Address/Default/';
  static const addressDelete = '/user/Address/Delete/';
  static const addressUpdate = '/user/Address/Update';
  static const userAddress = '/user/Address/';
  static const sendSMS = '/user/User/SendSMS/';
  static const userAddressSort = '/user/Address/Sort/';
  static const userAddressSearch = '/user/Address/Search/';

  //Product
  static const getCategories = '/product/GetCategories/';
  static const getProduct = '/product/GetProducts/';
  static const getProductPriceList = '/product/GetProductPriceList/';
  static const productPriceListByProduct =
      '/product/GetProductPriceListByProduct/';
  static const getProductPriceListByCategory =
      '/product/GetProductPriceListByCategory/';
  static const getCategoryByID = '/product/GetCategoryById/';

  //Order
  static const createOrder = '/Order/CreateOrder';
  static const getOrders = '/Order/GetOrders/';
  static const saveOrdersDetails = '/Order/SaveOrderDetails/';
  static const getOrdersDetails = '/Order/GetOrderDetails/';
  static const getOrderByID = '/Order/GetOrderByOrderId/';
  static const getOrderByFilter = '/Order/GetOrderByFilter/';
  static const updateOrderStatus = '/Order/UpdateOrderStatus/';
  static const createShipment = '/Order/CreateShipment/';
  static const updateShipmentStatus = '/Order/UpdateShipmentStatus/';
  static const updateShipmentInfo = '/Order/UpdateShipmentInfo/';
  static const getShipments = '/Order/GetShipments/';
  static const getShipmentInfo = '/Order/GetShipmentInfo/';
  static const getShipmentDate = '/Order/GetShipmentsByDate/';
  static const getShipmentByStatus = '/Order/GetShipmentsByStatus/';
  static const getOrderStatus = '/Order/GetOrderStatus/';
  static const getAWBLabel = '/Order/GetAWBLabel/';
  static const getAWBCurrentStatus = '/Order/TrackAWBCurrentStatus/';
  static const trackAWB = '/Order/TrackAWB/';

  //Wallet
  static const walletCreate = '/wallet/Create/';
  static const walletGet = '/wallet/Get/';
  static const walletGetTransaction = '/wallet/GetTransactions/';
  static const getDebitTransactionByID = '/wallet/GetDebitTransactionById/';
  static const getCreditTransactionByID = '/wallet/GetCreditTransactionById/';
  static const getTransactions = '/wallet/GetTransactions/';
  static const getTransactionByStatus = '/wallet/GetTransactionsByStatus/';
  static const getTransactionByStatusDate =
      '/wallet/GetTransactionsByStatusDate/';
  static const getWalletActivityLog = '/wallet/GetWalletActivityLog/';
}
