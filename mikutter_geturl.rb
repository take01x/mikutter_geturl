# -*- coding: utf-8 -*-

Plugin.create(:mikutter_geturl) do
  command(
          :mikutter_geturl,
          name: 'URLをコピー',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    urls = ""
    opt.messages.map{ |m|
      urls += "https://twitter.com/" + m.message.user.idname + "/status/" + m.message[:id_str] + " "
    }
    ::Gtk::Clipboard.copy(urls)
  end
end
