abstract class EndPoints {
  static const String assignEmployeeShift = "$baseUrl/api/employees/1/assign-shift";
  static const String transferEmployee = "$baseUrl/api/employees/1/transfer";
  static const String deleteEmployee = "$baseUrl/api/employees/1";
  static const String updateEmployee = "$baseUrl/api/employees/1";
  static const String showEmployee = "$baseUrl/api/employees/1";
  static const String createEmployee = "$baseUrl/api/employees";
  static const String listEmployees = "$baseUrl/api/employees";
  static const String deleteShift = "$baseUrl/api/shifts/1";
  static const String updateShift = "$baseUrl/api/shifts/1";
  static const String showShift = "$baseUrl/api/shifts/1";
  static const String createShift = "$baseUrl/api/shifts";
  static const String listShifts = "$baseUrl/api/shifts";
  static const String rotateBranchQrSecret = "$baseUrl/api/branches/1/rotate-secret";
  static const String verifyBranchQr = "$baseUrl/api/branches/1/verify-qr";
  static const String branchLiveQr = "$baseUrl/api/branches/1/live-qr";
  static const String deleteBranch = "$baseUrl/api/branches/1";
  static const String updateBranch = "$baseUrl/api/branches/1";
  static const String showBranch = "$baseUrl/api/branches/1";
  static const String createBranch = "$baseUrl/api/branches";
  static const String listBranches = "$baseUrl/api/branches";
  static const String holidays = "$baseUrl/api/holidays";
  static const String cancelLeaveRequest = "$baseUrl/api/leaves/1/cancel";
  static const String reviewLeaveRequest = "$baseUrl/api/leaves/1/review";
  static const String leaveApprovals = "$baseUrl/api/leaves/approvals";
  static const String myLeaveRequests = "$baseUrl/api/leaves/my-requests";
  static const String createLeaveRequest = "$baseUrl/api/leaves";
  static const String leaveBalances = "$baseUrl/api/leaves/balances";
  static const String leaveTypes = "$baseUrl/api/leaves/types";
  static const String listAttendanceCorrections = "$baseUrl/api/attendance/corrections";
  static const String createAttendanceCorrection = "$baseUrl/api/attendance/corrections";
  static const String attendanceHistory = "$baseUrl/api/attendance/history";
  static const String attendanceToday = "$baseUrl/api/attendance/today";
  static const String checkOut = "$baseUrl/api/attendance/check-out";
  static const String checkIn = "$baseUrl/api/attendance/check-in";
  static const String logout = "$baseUrl/api/auth/logout";
  static const String me = "$baseUrl/api/auth/me";


  static const String baseUrl = "https://team.pissarde.com";

  // Api Endpoints
  static const String login = '/api/login';
  static const String sendResetPWLink = '/api/forgot-password';

  static const String getProjects = '/api/ ';
}
