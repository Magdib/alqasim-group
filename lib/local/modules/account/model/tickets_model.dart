class TicketModel {
  final String ticketId;
  final String subject;
  final String status;
  final String message;

  TicketModel(
      {required this.ticketId,
      required this.subject,
      required this.status,
      required this.message});
}
