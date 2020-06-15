package com.rcforte.portfolioservice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Portfolio {
  private Long id;
  private List<Allocation> allocations;
}
