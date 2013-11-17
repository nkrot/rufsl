#
# Auto   |  Gold
#        |  yes   |  no
# -------------------------
# yes    |  tp    | fp
# no     |  fn    | tn
#
# tp and tn are decisions that match
# fp and fn are decisions that do not match
#

module Quality
  def self.accuracy *args
    if args.length == 2
      # treat args as: number_of_equal, number_of_different
      args[0].to_f / (args[0] + args[1])

    elsif args.length == 4
      # treat args as: tp, tn, fp, fn
      tp, tn, fp, fn = args
      accuracy(tp+tn, fp+fn)
    end
  end

  def self.precision tp, fp
    tp.to_f / (tp+fp)
  end

  def self.recall tp, fn
    tp.to_f / (tp+fn)
  end
end

