abstract class EndPoints {


///emplyees
  static   String deleteEmployee (dynamic id)=> "/api/employees/$id";
  static   String updateEmployee (dynamic id)=> "/api/employees/$id";
  static   String showEmployee (String id)=> "/api/employees/$id";
  static const String createEmployee = "/api/employees";
  static const String listEmployees = "/api/employees";

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

  static const String rotateBranchQrSecret = "/api/branches/1/rotate-secret";
  static const String verifyBranchQr = "/api/branches/1/verify-qr";
  static const String branchLiveQr = "/api/branches/1/live-qr";



  static const String holidays = "/api/holidays";
  static const String cancelLeaveRequest = "/api/leaves/1/cancel";
  static const String reviewLeaveRequest = "/api/leaves/1/review";
  static const String leaveApprovals = "/api/leaves/approvals";
  static const String myLeaveRequests = "/api/leaves/my-requests";
  static const String createLeaveRequest = "/api/leaves";
  static const String leaveBalances = "/api/leaves/balances";
  static const String leaveTypes = "/api/leaves/types";
  static const String listAttendanceCorrections = "/api/attendance/corrections";
  static const String createAttendanceCorrection = "/api/attendance/corrections";

  ///attendance
  static const String attendanceHistory = "/api/attendance/history";
  static const String attendanceToday = "/api/attendance/today";
  static const String checkOut = "/api/attendance/check-out";
  static const String checkIn = "/api/attendance/check-in";


  static const String logout = "/api/auth/logout";
  static const String getProfile = "/api/auth/me";
  static const String login = '/api/auth/login';

  static const String baseUrl = "https://team.pissarde.com";



}
