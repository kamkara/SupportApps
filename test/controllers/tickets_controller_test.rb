require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { contact: @ticket.contact, description: @ticket.description, full_name: @ticket.full_name, montant: @ticket.montant, operation: @ticket.operation, ref_facturier: @ticket.ref_facturier, ref_operation: @ticket.ref_operation, service: @ticket.service, slug: @ticket.slug, title: @ticket.title, user: @ticket.user } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { contact: @ticket.contact, description: @ticket.description, full_name: @ticket.full_name, montant: @ticket.montant, operation: @ticket.operation, ref_facturier: @ticket.ref_facturier, ref_operation: @ticket.ref_operation, service: @ticket.service, slug: @ticket.slug, title: @ticket.title, user: @ticket.user } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
