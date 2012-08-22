module FontAwesome
  class HexCode
    HEX_CODES = {"glass"=>"f000", "music"=>"f001", "search"=>"f002", "envelope"=>"f003", "heart"=>"f004", "star"=>"f005", "star-empty"=>"f006", "user"=>"f007", "film"=>"f008", "th-large"=>"f009", "th"=>"f00a", "th-list"=>"f00b", "ok"=>"f00c", "remove"=>"f00d", "zoom-in"=>"f00e", "zoom-out"=>"f010", "off"=>"f011", "signal"=>"f012", "cog"=>"f013", "trash"=>"f014", "home"=>"f015", "file"=>"f016", "time"=>"f017", "road"=>"f018", "download-alt"=>"f019", "download"=>"f01a", "upload"=>"f01b", "inbox"=>"f01c", "play-circle"=>"f01d", "repeat"=>"f01e", "refresh"=>"f021", "list-alt"=>"f022", "lock"=>"f023", "flag"=>"f024", "headphones"=>"f025", "volume-off"=>"f026", "volume-down"=>"f027", "volume-up"=>"f028", "qrcode"=>"f029", "barcode"=>"f02a", "tag"=>"f02b", "tags"=>"f02c", "book"=>"f02d", "bookmark"=>"f02e", "print"=>"f02f", "camera"=>"f030", "font"=>"f031", "bold"=>"f032", "italic"=>"f033", "text-height"=>"f034", "text-width"=>"f035", "align-left"=>"f036", "align-center"=>"f037", "align-right"=>"f038", "align-justify"=>"f039", "list"=>"f03a", "indent-left"=>"f03b", "indent-right"=>"f03c", "facetime-video"=>"f03d", "picture"=>"f03e", "pencil"=>"f040", "map-marker"=>"f041", "adjust"=>"f042", "tint"=>"f043", "edit"=>"f044", "share"=>"f045", "check"=>"f046", "move"=>"f047", "step-backward"=>"f048", "fast-backward"=>"f049", "backward"=>"f04a", "play"=>"f04b", "pause"=>"f04c", "stop"=>"f04d", "forward"=>"f04e", "fast-forward"=>"f050", "step-forward"=>"f051", "eject"=>"f052", "chevron-left"=>"f053", "chevron-right"=>"f054", "plus-sign"=>"f055", "minus-sign"=>"f056", "remove-sign"=>"f057", "ok-sign"=>"f058", "question-sign"=>"f059", "info-sign"=>"f05a", "screenshot"=>"f05b", "remove-circle"=>"f05c", "ok-circle"=>"f05d", "ban-circle"=>"f05e", "arrow-left"=>"f060", "arrow-right"=>"f061", "arrow-up"=>"f062", "arrow-down"=>"f063", "share-alt"=>"f064", "resize-full"=>"f065", "resize-small"=>"f066", "plus"=>"f067", "minus"=>"f068", "asterisk"=>"f069", "exclamation-sign"=>"f06a", "gift"=>"f06b", "leaf"=>"f06c", "fire"=>"f06d", "eye-open"=>"f06e", "eye-close"=>"f070", "warning-sign"=>"f071", "plane"=>"f072", "calendar"=>"f073", "random"=>"f074", "comment"=>"f075", "magnet"=>"f076", "chevron-up"=>"f077", "chevron-down"=>"f078", "retweet"=>"f079", "shopping-cart"=>"f07a", "folder-close"=>"f07b", "folder-open"=>"f07c", "resize-vertical"=>"f07d", "resize-horizontal"=>"f07e", "bar-chart"=>"f080", "twitter-sign"=>"f081", "facebook-sign"=>"f082", "camera-retro"=>"f083", "key"=>"f084", "cogs"=>"f085", "comments"=>"f086", "thumbs-up"=>"f087", "thumbs-down"=>"f088", "star-half"=>"f089", "heart-empty"=>"f08a", "signout"=>"f08b", "linkedin-sign"=>"f08c", "pushpin"=>"f08d", "external-link"=>"f08e", "signin"=>"f090", "trophy"=>"f091", "github-sign"=>"f092", "upload-alt"=>"f093", "lemon"=>"f094", "phone"=>"f095", "check-empty"=>"f096", "bookmark-empty"=>"f097", "phone-sign"=>"f098", "twitter"=>"f099", "facebook"=>"f09a", "github"=>"f09b", "unlock"=>"f09c", "credit-card"=>"f09d", "rss"=>"f09e", "hdd"=>"f0a0", "bullhorn"=>"f0a1", "bell"=>"f0a2", "certificate"=>"f0a3", "hand-right"=>"f0a4", "hand-left"=>"f0a5", "hand-up"=>"f0a6", "hand-down"=>"f0a7", "circle-arrow-left"=>"f0a8", "circle-arrow-right"=>"f0a9", "circle-arrow-up"=>"f0aa", "circle-arrow-down"=>"f0ab", "globe"=>"f0ac", "wrench"=>"f0ad", "tasks"=>"f0ae", "filter"=>"f0b0", "briefcase"=>"f0b1", "fullscreen"=>"f0b2", "group"=>"f0c0", "link"=>"f0c1", "cloud"=>"f0c2", "beaker"=>"f0c3", "cut"=>"f0c4", "copy"=>"f0c5", "paper-clip"=>"f0c6", "save"=>"f0c7", "sign-blank"=>"f0c8", "reorder"=>"f0c9", "list-ul"=>"f0ca", "list-ol"=>"f0cb", "strikethrough"=>"f0cc", "underline"=>"f0cd", "table"=>"f0ce", "magic"=>"f0d0", "truck"=>"f0d1", "pinterest"=>"f0d2", "pinterest-sign"=>"f0d3", "google-plus-sign"=>"f0d4", "google-plus"=>"f0d5", "money"=>"f0d6", "caret-down"=>"f0d7", "caret-up"=>"f0d8", "caret-left"=>"f0d9", "caret-right"=>"f0da", "columns"=>"f0db", "sort"=>"f0dc", "sort-down"=>"f0dd", "sort-up"=>"f0de", "envelope-alt"=>"f0e0", "linkedin"=>"f0e1", "undo"=>"f0e2", "legal"=>"f0e3", "dashboard"=>"f0e4", "comment-alt"=>"f0e5", "comments-alt"=>"f0e6", "bolt"=>"f0e7", "sitemap"=>"f0e8", "umbrella"=>"f0e9", "paste"=>"f0ea", "user-md"=>"f200"}.freeze

    attr_accessor :name

    def initialize(name)
      self.name = name
    end

    def name=(value)
      @name = value.to_s.gsub("_", "-")
    end

    def to_s
      self.class.lookup_table[name]
    end

    def to_unicode
      [to_s.hex].pack("U")
    end

    def to_css
      "\\#{to_s}"
    end

    def to_xml
      "&#x#{to_s};"
    end

    def self.all
      lookup_table.each
    end

    def self.lookup_table
      HEX_CODES
    end
  end
end