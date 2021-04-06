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
      post tickets_url, params: { ticket: { amount: @ticket.amount, author: @ticket.author, contact: @ticket.contact, content: @ticket.content, custom_name: @ticket.custom_name, id_facturier: @ticket.id_facturier, id_transaction: @ticket.id_transaction, operation: @ticket.operation, service: @ticket.service, slug: @ticket.slug, title: @ticket.title, user_id: @ticket.user_id } }
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
    patch ticket_url(@ticket), params: { ticket: { amount: @ticket.amount, author: @ticket.author, contact: @ticket.contact, content: @ticket.content, custom_name: @ticket.custom_name, id_facturier: @ticket.id_facturier, id_transaction: @ticket.id_transaction, operation: @ticket.operation, service: @ticket.service, slug: @ticket.slug, title: @ticket.title, user_id: @ticket.user_id } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
