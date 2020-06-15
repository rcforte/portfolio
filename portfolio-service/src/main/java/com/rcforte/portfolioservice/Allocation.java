package com.rcforte.portfolioservice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Allocation {
  private String instrument;
  private Double percent;
}
