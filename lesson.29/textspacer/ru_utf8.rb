# -*- coding: utf-8; -*-

class String

  alias orig_upcase upcase
  alias orig_downcase downcase

  @@lower = 'йцукенгшщзхъфывапролджэячсмитьбю'
  @@upper = 'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'

  def self.lower
    @@lower
  end

  def self.upper
    @@upper
  end

  def upcase
    self.orig_upcase.tr(@@lower, @@upper)
  end

  def downcase
    self.orig_downcase.tr(@@upper, @@lower)
  end
end

