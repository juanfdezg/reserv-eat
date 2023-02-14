# frozen_string_literal: true

# ReservationMailerTest
class ReservationMailerTest < ActionMailer::TestCase
  test 'new order email' do
    # Set up an order based on the fixture
    reservation = reservations(:one)

    # Set up an email using the order contents
    email = ReservationMailer.with(reservation: reservation).new_reservation_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal [current_user.email], email.from
    assert_equal [current_user.email], email.to
    assert_equal 'You got a new order!', email.subject
    assert_match reservation.fecha_reserva, email.html_part.body.encoded
    assert_match reservation.hora_inicio, email.text_part.body.encoded
    assert_match reservation.hora_termino, email.html_part.body.encoded
  end
end
