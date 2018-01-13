#include <algorithm>
#include <cassert>
#include <cstdlib>

#include "lv2/lv2plug.in/ns/lv2core/lv2.h"

#ifndef XS_URI
  #error "XS_URI must be defined"
#endif

#define XS_QUOTE(name) #name
#define XS_STR(macro) XS_QUOTE(macro)
#define XS_URI_QUOTED XS_STR(XS_URI)

enum xs_port_t {
  XS_INPUT_0L  = 0,
  XS_INPUT_0R  = 1,
  XS_INPUT_1L  = 2,
  XS_INPUT_1R  = 3,
  XS_INPUT_2L  = 4,
  XS_INPUT_2R  = 5,
  XS_INPUT_3L  = 6,
  XS_INPUT_3R  = 7,
  XS_INPUT_4L  = 8,
  XS_INPUT_4R  = 9,
  XS_INPUT_5L  = 10,
  XS_INPUT_5R  = 11,
  XS_INPUT_6L  = 12,
  XS_INPUT_6R  = 13,
  XS_INPUT_7L  = 14,
  XS_INPUT_7R  = 15,
  XS_OUTPUT_0L = 16,
  XS_OUTPUT_OR = 17,
  XS_SELECT    = 18
};

struct xs_state_t {
	const float  *inputs[16];
	float        *output_L;
  float        *output_R;
  const float  *selection;
};

static LV2_Handle
xs_instantiate(
  const LV2_Descriptor *descriptor,
  double rate,
  const char *bundle_path,
  const LV2_Feature * const *features)
{
	return (LV2_Handle) (struct xs_state_t *) calloc(1, sizeof(struct xs_state_t));
}

static void
xs_connect_port(
  LV2_Handle instance,
  uint32_t port,
  void *data)
{
	xs_state_t *state = (xs_state_t *) instance;

	switch ((enum xs_port_t) port) {
    case XS_INPUT_0L:
    case XS_INPUT_0R:
    case XS_INPUT_1L:
    case XS_INPUT_1R:
    case XS_INPUT_2L:
    case XS_INPUT_2R:
    case XS_INPUT_3L:
    case XS_INPUT_3R:
    case XS_INPUT_4L:
    case XS_INPUT_4R:
    case XS_INPUT_5L:
    case XS_INPUT_5R:
    case XS_INPUT_6L:
    case XS_INPUT_6R:
    case XS_INPUT_7L:
    case XS_INPUT_7R:
    {
      assert (port >= 0 && port < 16);
      state->inputs[port] = (const float *) data;
      break;
    }
    case XS_OUTPUT_0L:
    {
      state->output_L = (float *) data;
      break;
    }
    case XS_OUTPUT_OR:
    {
      state->output_R = (float *) data;
      break;
    }
    case XS_SELECT:
    {
      state->selection = (const float *) data;
      break;
    }
	}
}

static void
xs_activate(
  LV2_Handle instance)
{

}

static unsigned int
xs_clamp_input_port(
  const float port)
{
  const unsigned int iport = (const unsigned int) port;
  return std::max(1u, std::min(iport, 8u));
}

static void
xs_run(
  LV2_Handle instance,
  uint32_t n_samples)
{
  xs_state_t *state = (xs_state_t *) instance;

  const float select_f = *(state->selection);
  const unsigned int select_i = xs_clamp_input_port(select_f);
  const unsigned int select_L = (select_i - 1u) * 2u;
  const unsigned int select_R = ((select_i - 1u) * 2u) + 1u;

  const float *input_L = state->inputs[select_L];
  const float *input_R = state->inputs[select_R];

  float *output_L = state->output_L;
  float *output_R = state->output_R;

	for (uint32_t pos = 0; pos < n_samples; pos++) {
    output_L[pos] = input_L[pos];
    output_R[pos] = input_R[pos];
	}
}

static void
xs_deactivate(
  LV2_Handle instance)
{

}

static void
xs_cleanup(
  LV2_Handle instance)
{
	free(instance);
}

static const void *
xs_extension_data(
  const char *uri)
{
	return NULL;
}

static const LV2_Descriptor xs_descriptor =
{
	XS_URI_QUOTED,
	xs_instantiate,
	xs_connect_port,
	xs_activate,
	xs_run,
	xs_deactivate,
	xs_cleanup,
	xs_extension_data
};

extern "C" {

LV2_SYMBOL_EXPORT
const LV2_Descriptor*
lv2_descriptor(
  uint32_t index)
{
	switch (index) {
	  case 0:  return &xs_descriptor;
	  default: return NULL;
	}
}

};
