import { View, Text, StyleSheet } from 'react-native';
import { colors } from '../theme/colors';

type SetRowProps = {
  index: number;
  weight?: number;
  reps?: number;
  rir?: number;
};

export function SetRow({ index, weight, reps, rir }: SetRowProps) {
  return (
    <View style={styles.row}>
      <Text style={styles.index}>#{index}</Text>
      <Text style={styles.value}>{weight ?? '-'} kg</Text>
      <Text style={styles.value}>{reps ?? '-'} reps</Text>
      <Text style={styles.value}>{rir != null ? `${rir} RIR` : '- RIR'}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  row: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', backgroundColor: colors.surface, borderColor: colors.surfaceBorder, borderWidth: 1, borderRadius: 10, paddingVertical: 10, paddingHorizontal: 12, marginBottom: 8 },
  index: { color: colors.textMuted, width: 40 },
  value: { color: colors.text, fontWeight: '600' },
});

