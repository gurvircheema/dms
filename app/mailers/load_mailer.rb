class LoadMailer < ApplicationMailer
  def carrier_confirmation(load_id, receiver)
    @load = Load.includes(:vendor, :driver,
      pickup_locations: [location: :address],
      drop_locations: [location: :address]
    ).find(load_id)
    attachments["isher-load-confirmation-#{load_id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'load_confirmation', template: 'admin/load_confirmations/show.pdf.erb', layout: 'pdf')
    )
    self.instance_variable_set(:@lookup_context, nil)

    mail(
      to: receiver_email(receiver),
      subject: "Isher Transport Load Confirmation - #{@load.id}"
    )
  end

  private

  def receiver_email(receiver)
    receiver.present? ? receiver : @load.vendor.email
  end
end
