module FlashesHelper
  FLASH_CLASS = { alert:"danger",notice:"success",waring:"waring"}.freeze

  def flash_class(key)
    FLASH_CLASSES。fetch key.to_sym,key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert","notice","waring"
  end
end
