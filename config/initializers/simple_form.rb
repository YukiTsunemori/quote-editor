SimpleForm.setup do |config|
  config.wrappers :default, class: :input,
    hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label_input
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end
  # default configurations
  config.default_wrapper = :default
  # この設定はHTMLで規定のフォームを使用する場合に必要です。
  config.boolean_style = :nested # この設定は、チェックボックスとラジオボタンのスタイルをネストされた形式にします。
  config.button_class = "btn" # ボタンのクラスを設定します。
  config.error_notification_tag = :div # エラーメッセージの通知を表示するタグを設定します。
  config.error_notification_class = "error_notification" # エラーメッセージの通知に使用するクラスを設定します。
  config.browser_validations = false # ブラウザのバリデーションを無効にします。
  config.boolean_label_class = "checkbox" # チェックボックスのラベルに使用するクラスを設定します。
end
