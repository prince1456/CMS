module Admin::MessagesHelper

  def messages_weight message
    message.status == false ? weight = 'font-weight: bold' : weight = 'font-weight: normal'
  end
  def build_read_status_link message
    if message.status == true
      link_to "Unread", admin_message_path(message, status: false), method: :put
    else
    link_to "Read", admin_message_path(message, status: true), method: :put
    end
  end
end
