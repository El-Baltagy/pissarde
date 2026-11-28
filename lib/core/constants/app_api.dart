abstract class EndPoints {


///emplyees
  static   String deleteEmployee (dynamic id)=> "/api/employees/$id";
  static   String updateEmployee (dynamic id)=> "/api/employees/$id";
  static   String showEmployee (String id)=> "/api/employees/$id";
  static const String createEmployee = "/api/employees";
  static const String listEmployees = "/api/employees";
  static const String getSupervisors = '/api/supervisors';

  static const String assignEmployeeShift = "/api/employees/1/assign-shift";
  static const String transferEmployee = "/api/employees/1/transfer";

  ///shifts
  static   String deleteShift (dynamic id)=> "/api/shifts/$id";
  static   String updateShift (dynamic id)=> "/api/shifts/$id";
  static const String showShift = "/api/shifts/1";
  static const String createShift = "/api/shifts";
  static const String listShifts = "/api/shifts";

  ///branches
  static   String deleteBranch (dynamic id)=> "/api/branches/$id";
  static   String updateBranch (dynamic id)=> "/api/branches/$id";
  static const String showBranch = "/api/branches/1";
  static const String createBranch = "/api/branches";
  static const String listBranches = "/api/branches";

  // التحقق المسبق من صحة رمز QR مسحوح بالهاتف
  static const String verifyBranchQr = "/api/branches/1/verify-qr";

  // جلب رمز الـ QR الثابت الحالي لشاشة الفرع
  static const String branchLiveQr = "/api/branches/1/live-qr";
  static   String rotateBranchQr (String id)=> "/api/branches/$id/rotate-secret";



  /// leaves
 // إلغاء طلب إجازة معلق للموظف واستعادة الرصيد المحجوز
  static String cancelLeaveRequest(dynamic id) => "/api/leaves/$id/cancel";

  // اعتماد أو رفض طلب إجازة مرؤوس مع تدوين الملاحظات
  static String reviewLeaveRequest(dynamic id) => "/api/leaves/$id/review";

  // طلبات الإجازة المعلقة بانتظار موافقة (المشرف / HR / الإدارة)
  static const String getPendingApprovalLeaves = "/api/leaves/approvals";

  /// استعراض طلبات الإجازة السابقة الخاصة بالموظف
   static const String getMyLeaveRequests = '/api/leaves/my-requests';

// تقديم طلب إجازة جديد (مع إمكانية إرفاق تقرير
  static const String createLeaveRequest = "/api/leaves";

  // استعلام رصيد الإجازات المتبقي والمستهلك للسنة
  static const String getLeaveBalances = "/api/leaves/balances";
  // قائمة أنواع الإجازات  (سنوية، مرضية،
  static const String getLeaveTypes = "/api/leaves/types";

  ///attendance

  // قائمة طلبات التصحيح الخاصة بالموظف
  static const String listAttendanceCorrections = "/api/attendance/corrections";

  // تقديم طلب تصحيح بصمة منسية أو خاطئة مع السبب
  static const String createAttendanceCorrection = "/api/attendance/corrections";
  static const String attendanceHistory = "/api/attendance/history";
  static const String attendanceToday = "/api/attendance/today";
  static const String checkOut = "/api/attendance/check-out";
  static const String checkIn = "/api/attendance/check-in";

  static const String attendanceSummary = "/attendance/daily-summary";


  static const String logout = "/api/auth/logout";
  static const String getProfile = "/api/auth/me";
  static const String login = '/api/auth/login';
  static const String holidays = "/api/holidays";
  static const String getNotification = "/api/notifications";
  static const String setFcmTokenIntoDB = "/api/device-tokens";

  static const String baseUrl = "https://team.pissarde.com";


}
